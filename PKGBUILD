# Maintainer: grimi
pkgname=bencodetools-git
pkgver=r214.384d78d
pkgrel=1
pkgdesc="A collection of tools for manipulating bencoded data."
arch=("x86_64")
url="https://gitlab.com/heikkiorsila/bencodetools"
license=("custom")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/heikkiorsila/bencodetools.git")
md5sums=("SKIP")


pkgver() {
   cd "${pkgname%-git}"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr --lib-path=/usr/lib --package-prefix="${pkgdir}" --without-python
  make
}

package() {
  cd ${pkgname%-git}
  make install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-git}/LICENSE
}

