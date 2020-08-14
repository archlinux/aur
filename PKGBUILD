# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: peeweep <peeweep at 0x0 dot ee>

_pkgname=sherlock
pkgname=${_pkgname}-git
pkgver=r1276.ca89d12
pkgrel=1
pkgdesc='Hunt down social media accounts by username across social networks'
arch=('any')
url='https://github.com/sherlock-project/sherlock'
license=('MIT')
depends=('python'
         'python-beautifulsoup4'
         'python-certifi'
         'python-colorama'
         'python-lxml'
         'python-pysocks'
         'python-requests'
         'python-requests-futures'
         'python-soupsieve'
         'python-stem'
         'python-torrequest')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            '21c364a2de4c5a491d85c1e6e9ecb4913505a436aa0db75fe98b367209913500')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  cd "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" {removed_sites.md,sites.md,README.md}
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  cp -a "${_pkgname}/"* "${pkgdir}/usr/share/${_pkgname}"
}

# vim: ts=2 sw=2 et:
