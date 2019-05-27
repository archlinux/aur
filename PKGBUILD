# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>
# Contributor: Olaf Leidinger <oleid@mescharet.de>

pkgname=futhark-nightly
pkgver=0.11.0.r03a6258
pkgrel=1
pkgdesc="A data-parallel functional programming language"
arch=('x86_64')
url="https://github.com/diku-dk/futhark"
license=('ISC')
depends=('ncurses5-compat-libs'
         'zlib'
         'gmp')
optdepends=('opencl-headers: opencl support'
            'ocl-icd: opencl support'
            'opencl-driver: opencl support')
makedepends=()
provides=("${pkgname%-nightly}")
conflicts=("${pkgname%-nightly}")
source=("${pkgname}-${pkgver}.tar.gz::https://futhark-lang.org/releases/futhark-nightly-linux-x86_64.tar.xz")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/futhark-nightly-linux-x86_64"
  printf "%s.r%s" "$(./bin/futhark -V | grep Futhark | sed "s/Futhark //")" "$(cat commit-id)"
}

package() {
	cd "${srcdir}/futhark-nightly-linux-x86_64"
	make PREFIX="${pkgdir}/usr" install

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
