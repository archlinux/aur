# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgname=masscanned-git
_pkgname=masscanned
pkgver=0.2.0.dev44
pkgrel=1
pkgdesc='A low-interaction focused on network scanners and bots. It integrates very well with IVRE to build a self-hosted alternative to GreyNoise.'
arch=('any')
url='https://ivre.rocks/'
license=('GPL3')
makedepends=('git' 'rust')
source=("git+https://github.com/ivre/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed -r 's#^v##;s#-([^-]*)-.*#.dev\1#'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  conflicts=("${_pkgname}")
  provides=("${_pkgname}")
  cd "${srcdir}/${_pkgname}"
  install -Dvm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
