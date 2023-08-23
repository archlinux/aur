# Maintiner: Mikhail f. Shiryaev <mr dot felixoid at gmail com>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=dh-make-golang
pkgver=0.6.0
pkgrel=1
pkgdesc="debianize go library packages"
arch=('x86_64' 'i686')
url=https://github.com/Debian/dh-make-golang
license=('BSD')
depends=('pristine-tar' 'git-buildpackage')
makedepends=('go'
             'pandoc'
             'git')
options=('!strip' '!emptydirs')
source=(
  "https://github.com/Debian/dh-make-golang/archive/v${pkgver}.tar.gz"
)

sha256sums=(
  6e704bb56ae3d253dc30a12eb8587d70443b0bc2136db312647e03887f979d2d
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
