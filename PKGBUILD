# Maintiner: Mikhail f. Shiryaev <mr dot felixoid at gmail com>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=dh-make-golang
pkgver=0.3.3
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
  "http://deb.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_${pkgver}-2.debian.tar.xz"
  "https://github.com/Debian/dh-make-golang/archive/v${pkgver}.tar.gz"
)

sha256sums=(
0a101df22fe8fbf02b56727ce9de7a1d14b857bde065d07b92c51c33fb967f5c
9eb706dfd0706b59fdf3fcbb0f1266ee08dcff236e1a8c5a334b269e8a811c0f
)

build() {
  cd "${pkgname}-${pkgver}"

  go build
}

package() {
  cd "${srcdir}/debian/man"
  pandoc -f markdown -t man -s dh-make-golang.md -o dh-make-golang.1
  install -Dm644 dh-make-golang.1 "${pkgdir}/usr/share/man/man1/dh-make-golang.1"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
