# Maintainer: Jordan MacDonald <jordan(at)wastedintelligence(dot)com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jmacdonald
_pkgname=amp
pkgname=${_pkgname}
pkgver=0.7.1
pkgrel=1
pkgdesc='A modal text editor for the terminal.'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('libxcb')
makedepends=('rust' 'git' 'cmake' 'libxcb' 'python')
source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('21227a5212777e5687af0357eb34ca6498f47eabbc9e37d2db3fef0de65dab8daf99a6270485b551b3a2660a0aedf90b494b2ea0cfd66027815dbde369b78497')

build() {
  cd "$pkgname-$pkgver" || exit

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}" || exit

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
