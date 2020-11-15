# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: peeweep <peeweep at 0x0 dot ee>

_pkgname='sherlock'
pkgname="${_pkgname}-git"
pkgver=r1480.9d824d1
pkgrel=2
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
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  echo -e "#!/bin/sh\nexec python /usr/share/${_pkgname}/${_pkgname}.py \"\$@\"" > "${_pkgname}.sh"
}

package() {
  install -Dvm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  cd "${_pkgname}"
  install -Dvm644 {'removed_sites.md','sites.md','README.md'} -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -dv "${pkgdir}/usr/share/${_pkgname}"
  cp -afv "${_pkgname}/"* "${pkgdir}/usr/share/${_pkgname}"
}

# vim: ts=2 sw=2 et:
