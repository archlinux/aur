# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: blackleg <blackleg@openmailbox.org>

pkgname=kalibrate-rtl-git
pkgver=r69.340003e
pkgrel=2
pkgdesc='Fork of http://thre.at/kalibrate/ for use with rtl-sdr devices'
arch=(i686 x86_64)
license=(BSD-2-Clause)
url="https://github.com/steve-m/kalibrate-rtl"
depends=(gcc-libs glibc fftw rtl-sdr)
makedepends=(git)
conflicts=(kalibrate-rtl)
provides=(kalibrate-rtl)
source=("${pkgname}::git+https://github.com/steve-m/kalibrate-rtl.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  ./bootstrap
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 "${srcdir}/${pkgname}/src/kal" "${pkgdir}/usr/bin/kalibrate-rtlsdr"
}
