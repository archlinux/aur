# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=emulationstation-autoscraper
pkgver=1.4.5
pkgrel=1
pkgdesc="An auto-scraper for EmulationStation written in Go using hashes"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/sselph/scraper"
license=('custom')
makedepends=('git' 'go')

source=("https://github.com/sselph/scraper/archive/v${pkgver}.tar.gz")
sha256sums=('5e7496b7634126f5be81fdd88a20fe108f40d4a8a0089b2d07ae82ea2cea812c')

scraperdir="scraper-${pkgver}"

build() {
  cd "${srcdir}/${scraperdir}"
  echo $arch
  echo $(go build github.com/sselph/scraper)
}

package() {
  cd "${srcdir}/${scraperdir}"
  strip "scraper"
  install -Dm755 "${srcdir}/${scraperdir}/scraper" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${scraperdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  for LIC in $(find vendor/github.com -name LICENSE); do
    PKGNAME="$(echo ${LIC} | awk -F "/" '{print $(NF-1)}')"
    install -Dm644 "${srcdir}/${scraperdir}/${LIC}" "${pkgdir}/usr/share/licenses/${pkgname}/license.${PKGNAME}"
  done
}
