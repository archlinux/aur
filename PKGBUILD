# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=pantheon-default-settings-git
pkgname=('pantheon-default-settings-git')
pkgver=5.1.2.r17.gc15e2d3
pkgrel=1
arch=('any')
url='https://github.com/elementary/default-settings'
license=('GPL')
groups=('pantheon-unstable')
makedepends=('git' 'meson' 'gnome-settings-daemon' 'accountsservice' )
source=('pantheon-default-settings::git+https://github.com/elementary/default-settings.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-default-settings

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson pantheon-default-settings build \
    -Ddefault-wallpaper='Sunset by the Pier.jpg'
  ninja -C build
}
package() {
  pkgdesc='Default settings for Pantheon'
  depends=('elementary-icon-theme' 'gtk-theme-elementary'
           'elementary-wallpapers' 'ttf-droid' 'ttf-opensans')
  provides=('pantheon-default-settings')
  conflicts=('pantheon-default-settings')
  optdepends=('lightdm-pantheon-greeter')

  DESTDIR=$pkgdir ninja -C build install
  rm $pkgdir/usr/share/cups/data/default-testpage.pdf 


}

# vim: ts=2 sw=2 et:
