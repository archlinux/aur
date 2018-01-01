# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-session-git
pkgver=r107.17e088e
pkgrel=1
pkgdesc='The Pantheon Session Handler'
arch=('any')
url='https://github.com/elementary/session-settings'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cerbere-git' 'dconf' 'gala-git' 'gconf' 'gnome-keyring'
         'gnome-session' 'gnome-user-share' 'pantheon-applications-menu-git'
         'pantheon-dpms-helper-git' 'plank' 'wingpanel-git'
         'xdg-user-dirs-gtk')
makedepends=('bzr')
optdepends=('pantheon-default-settings-git')
source=("pantheon-session::git+https://github.com/elementary/session-settings#branch=meson")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/pantheon-session
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/pantheon-session
  meson --prefix=/usr --datadir=share builddir
  DESTDIR=$pkgdir ninja -C builddir install
}

# vim: ts=2 sw=2 et:
