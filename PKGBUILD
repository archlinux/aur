# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=weather-bar
pkgver=1.1
pkgrel=2
pkgdesc="Weather plug-in for polybar, lemonbar, and others. With geolocation, Weather Underground, and NOAA support"
arch=('i686' 'x86_64')
url="https://github.com/chrissnell/${pkgname}"
license=('BSD')
makedepends=('git' 'go' 'dep')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chrissnell/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea6459732eca589afed5df912a0ce85b4d75c964c5fe8b499f65a01dc98244e4')

prepare() {
  mkdir -p "${srcdir}/src/github.com/chrissnell/"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/chrissnell/${pkgname}"

  cd "${srcdir}/src/github.com/chrissnell/${pkgname}"
  GOPATH="${srcdir}" dep ensure
}

build() {
  cd "${srcdir}/src/github.com/chrissnell/${pkgname}"
  GOPATH="${srcdir}" go build .
}

package() {
  cd "${srcdir}/src/github.com/chrissnell/${pkgname}"
  install -Dm755 weather-bar "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 example/config "${pkgdir}/usr/share/${pkgname}/example/config"
  install -Dm644 example/polybar-config "${pkgdir}/usr/share/${pkgname}/example/polybar-config"
}

