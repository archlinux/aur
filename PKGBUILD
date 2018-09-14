# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=remove_empty_subdirs

pkgname=remove_empty_subdirs-git
pkgver=r5.6324b2e
pkgrel=1
pkgdesc="Recursively remove empty sub-directories"
url="https://github.com/zhangkaizhao/remove_empty_subdirs"
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'Apache')
conflicts=('remove_empty_subdirs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --examples
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 target/release/examples/remove_empty_subdirs "${pkgdir}/usr/bin/remove_empty_subdirs"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
