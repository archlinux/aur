# Contributor: Niko Rosvall <niko@byteptr.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Co-Maintainer: Zachary Matthews <zacharymatt5@gmail.com>

pkgname=ylva-git
pkgver=1.7
pkgrel=2
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://github.com/nrosvall/ylva'
license=('GPL')
depends=('openssl' 'sqlite' 'qrcodegen')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' |tr - . |cut -c2-
}

build() {
  cd ${pkgname%-git}/src
  make 
}

package () {
  cd ${pkgname%-git}
  install -Dm755 src/${pkgname%-git}  "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 src/${pkgname%-git}.1 "$pkgdir"/usr/share/man/man1/${pkgname%-git}.1
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
