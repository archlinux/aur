# Maintainer: Carmine Paolino <carmine@paolino.me>

pkgname=spinel-git
pkgver=r8209.71939bd
pkgrel=1
pkgdesc='Ahead-of-time compiler for Ruby'
arch=('x86_64' 'aarch64')
url='https://github.com/matz/spinel'
license=('MIT')
depends=('gcc')
makedepends=('git' 'ruby')
provides=('spinel')
conflicts=('spinel')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  make deps
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}"
  make install PREFIX="${pkgdir}/usr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
