# Maintiner: Mikhail f. Shiryaev <mr dot felixoid at gmail com>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=dh-make-golang
pkgver=0.8.0
pkgrel=1
pkgdesc="debianize go library packages"
arch=('x86_64' 'i686')
url=https://github.com/Debian/dh-make-golang
license=('BSD')
depends=('git-buildpackage')
makedepends=('go'
             'pandoc'
             'git')
options=('!strip' '!emptydirs')
source=(
  "https://github.com/Debian/dh-make-golang/archive/v${pkgver}.tar.gz"
)

sha256sums=(
  13f86275887783984eae146c96d52ecd7e4738540df7b9b4219fc46efc619bc9
)

build() {
  cd "${pkgname}-${pkgver}"

  go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pandoc -f markdown -t man -s dh-make-golang.md -o dh-make-golang.1
  install -Dm644 dh-make-golang.1 "${pkgdir}/usr/share/man/man1/dh-make-golang.1"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
