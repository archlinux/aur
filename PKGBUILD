# Maintiner: Mikhail f. Shiryaev <mr dot felixoid at gmail com>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=dh-make-golang
pkgver=0.3.1
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
  "http://deb.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_${pkgver}-1.debian.tar.xz"
)

sha256sums=(
  '991e631a32c25cefe28e6caea044b879b23e036b9505626f7ac7fc78992f1080'
  'a83fb040914e1b82ec196f9dac7b619b681592cfd7be6f5f6414d69f9a4b5e3f'
)

build() {
  cd "${pkgname}-${pkgver}"

  go build
}

package() {
  cd "${srcdir}/debian"
  pandoc -f markdown -t man -s man/dh-make-golang.md -o dh-make-golang.1
  install -Dm644 dh-make-golang.1 "${pkgdir}/usr/share/man/man1/dh-make-golang.1"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
