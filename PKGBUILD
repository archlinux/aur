# Maintainer: Peter Hoeg <first name at last name dot com>

_pkgbase=dotcss
pkgname=${_pkgbase}-git
pkgver=2.2.0.r37.b016b1f
pkgrel=2
pkgdesc="Server component for injecting CSS into chrom(e|ium)"
arch=('any')
url="https://github.com/stewart/${_pkgbase}"
license=('MIT')
depends=('ruby')
provides=('dotcss')
source=("${pkgname}::git+${url}.git"
        'dcssd.service')
sha256sums=('SKIP'
            '15ce173350de282d24fc2737235222f2e5c0159eb07612cb8412bb314c114a16')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

package(){
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/lib/systemd/user
  install -D -m755 "${srcdir}/${pkgname}/bin/dcssd" "${pkgdir}/usr/bin/dcssd"
  install -D -m644 "${srcdir}/dcssd.service"        "${pkgdir}/usr/lib/systemd/user/dcssd.service"
}

# vim: set ts=2 sw=2 et:
