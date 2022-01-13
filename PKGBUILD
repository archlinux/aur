# Maintainer: fabon <syobon.hinata.public[at]gmail[dot]com>
pkgname='difftance-git'
pkgver=r5.25789f0
pkgrel=1
pkgdesc="A diff tool to show edit distance"
arch=('i686' 'x86_64')
url="https://github.com/fabon-f/difftance"
license=('MIT')
depends=('crystal')
makedepends=('git' 'make')
conflicts=('difftance-bin')

source=("${pkgname}::git+https://github.com/fabon-f/difftance.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make build
}

package() {
  cd "${srcdir}/${pkgname}"
  make install PREFIX="${pkgdir}/usr"
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
