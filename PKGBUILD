# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=emulationstation-autoscraper
pkgver=273.ca24b2b
pkgrel=1
pkgdesc="An auto-scraper for EmulationStation written in Go using hashes"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/sselph/scraper"
license=('custom')
makedepends=('git' 'go')

source=("https://raw.githubusercontent.com/sselph/scraper/master/LICENSE")
sha256sums=('SKIP')

build() {
  cd "${srcdir}"
  export GOPATH="${srcdir}"
  echo $(go get github.com/sselph/scraper)
  echo $(go build github.com/sselph/scraper)
}

package() {
  strip "${srcdir}/scraper"
  install -Dm755 "${srcdir}/scraper" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/src/github.com/sselph/scraper/LICENSE"		"${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  for LIC in $(find ./src/github.com/sselph/scraper/vendor/github.com -name LICENSE); do
    PKGNAME="$(echo ${LIC} | awk -F "/" '{print $(NF-1)}')"
    install -Dm644 "${srcdir}/${LIC}" "${pkgdir}/usr/share/licenses/${pkgname}/license.${PKGNAME}"
  done
}
