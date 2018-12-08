# Maintainer: Syu Takayama <syu.takayama@gmail.com>
pkgname=hashpump-git
pkgver=1.2.0.r8.314268e
pkgrel=1
pkgdesc="A tool to exploit the hash length extension attack in various hashing algorithms"
arch=("i686" "x86_64")
url="https://github.com/bwall/HashPump"
license=('MIT')
depends=('openssl')
makedepends=('git' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/bwall/HashPump.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
  install -D -m755 hashpump "${pkgdir}/usr/bin/hashpump"
}
