# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>

pkgname=midori
pkgver=0.5.9
pkgrel=1
pkgdesc='Lightweight web browser (GTK2)'
arch=('x86_64' 'i686')
url='http://www.midori-browser.org/'
license=('LGPL2.1')
install='midori.install'
depends=('libzeitgeist' 'webkitgtk2' 'libnotify' 'libxss' 'hicolor-icon-theme' 'desktop-file-utils' 'libunique')
makedepends=('bzr' 'python2' 'intltool' 'vala' 'librsvg' 'cmake' 'ninja')
optdepends=('aria2: download utility')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${pkgname}_${pkgver}_all_.tar.bz2")
sha256sums=('b1a5309d926ea4e394f4a39552023b0427cf23053793d325e3daefceed282ec0')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C "$pkgname-$pkgver/build" install
}

# vim:set ts=2 sw=2 et:
