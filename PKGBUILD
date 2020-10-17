# Maintainer: Que Quotion <quequotion@bugmenot.com> 
# Contributor: <shlomochoina@gmail.com> 

pkgname=pantheon-dock-instctl-git
pkgver=r1970.e9fa02b
pkgrel=2
pkgdesc='The Pantheon Dock (with instance controls)'
arch=('i686' 'x86_64')
url='https://www.reddit.com/r/elementaryos/comments/irt66g/instance_controls_close_switch_to_or_minimize/'
license=('GPL3')
groups=('pantheon-qq')
depends=('bamf' 'gnome-menus' lib{gee,granite.so} 'python')
makedepends=('git' gnome-{common,menus} lib{dbusmenu-gtk3,granite.so} 'meson' 'vala')
conflicts=('plank')
provides=('plank')
source=('pantheon-dock::git+https://github.com/elementary/dock'
        'instance-controls.patch')
sha256sums=('SKIP'
            '04bdb2b50e7150f9265664fd6d02ed894380c91af26fede3e4560bc80975e77c')

pkgver() {
  cd pantheon-dock

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-dock

  patch -Np1 < ../instance-controls.patch
}

build() {
  arch-meson pantheon-dock build -Dapport=false -Denable-dbusmenu=yes -Denable-barriers=yes
  ninja -C build
}
package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
