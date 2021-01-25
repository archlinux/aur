# Maintainer: Cleiton Floss <cleitonfloss@gmail.com>

pkgname=pantheon-tweaks-git
pkgver=r447.96ed0ce
pkgrel=1
pkgdesc='Pantheon Tweaks plug for Switchboard'
arch=('x86_64')
url='https://github.com/pantheon-tweaks/pantheon-tweaks'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'meson' 'vala')
provides=('pantheon-tweaks-git')
conflicts=('pantheon-tweaks')
source=('pantheon-tweaks::git+https://github.com/pantheon-tweaks/pantheon-tweaks.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/pantheon-tweaks"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson pantheon-tweaks build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
