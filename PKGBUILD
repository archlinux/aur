# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=freac-git
pkgver=1.1.7.r64.8360f601
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('x86_64')
url="https://www.freac.org"
license=('GPL-2.0-or-later')
depends=(
  'boca-git'
  'faac'
  'faad2'
  'hicolor-icon-theme'
  'lame'
  'libgudev'
  'libmp4v2'
  'libogg'
  'libpng'
  'libpulse'
  'libvorbis'
  'mpg123'
  'opus'
  'speex'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/enzo1982/freac.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
