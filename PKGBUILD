# Maintainer: fordprefect <fordprefect@dukun.de>
_pkgname=dnstwist
pkgname=${_pkgname}-git
pkgver=r6.5560dc3
pkgrel=1
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('unknown')
source=("git+https://github.com/elceef/dnstwist")
md5sums=('SKIP')

pkgver() {
  # idea "borrowed" from wiki
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
 
package() {
    #cd "${srcdir}/${_pkgname}"
    install -D "${srcdir}/${_pkgname}/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    mkdir -p "${pkgdir}/usr/share/dnstwist/examples/"
    cp "${srcdir}/${_pkgname}/report"* "${pkgdir}/usr/share/dnstwist/examples/"
  }
