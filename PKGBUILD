# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>

pkgname=mtag-git
pkgver=0.1.3
pkgrel=1
pkgdesc="Music file tag manipulator"
arch=('i686' 'x86_64')
url="https://github.com/hildigerr/mtag"
license=('PerlArtistic')
depends=('taglib')
makedepends=('git')
provides=("${pkgname%-git}")

source=(
    "${pkgname%-git}::git+${url}"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  grep version mtag.cpp | head -n 1 | cut -d\" -f 2
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 mtag.1 "${pkgdir}/usr/share/man/man1/mtag.1"
}
