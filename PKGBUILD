# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=mdproof

pkgname="${_pkgname}-git"
pkgver=r85.7cbd275
pkgrel=1
pkgdesc="A standalone markdown to PDF converter"
url="https://github.com/leroycep/mdproof"
license=('MPL2')
makedepends=('cargo')
arch=('x86_64')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 target/release/mdproof "${pkgdir}/usr/bin/mdproof"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 CHANGELOG.md "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -d "${pkgdir}/usr/share/doc/${_pkgname}/images"
  install -D -m644 images/readme-pdf.png "${pkgdir}/usr/share/doc/${_pkgname}/images/readme-pdf.png"
}
