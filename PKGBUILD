# Maintainer: Anand Pant

pkgname=tabex-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="Tabex CLI for browser session, capture, and page inspection"
arch=('x86_64')
url="https://github.com/shpitdev/tabex"
license=('LicenseRef-proprietary')
install="${pkgname}.install"
makedepends=('github-cli')
provides=('tabex')
conflicts=('tabex')

# Public PKGBUILD, private release asset. Users need GitHub access to the shpitdev org.
_asset="tabex_v${pkgver}_linux_amd64.tar.gz"
_sha256='b24871f68f28f748c691dfe18fcee6436c60d4d37beb25baecfacbdcb7e1177c'

prepare() {
  gh release download "v${pkgver}" \
    --repo shpitdev/tabex \
    --pattern "${_asset}" \
    --dir . --clobber

  echo "${_sha256}  ${_asset}" | sha256sum -c
  tar xzf "${_asset}"
}

package() {
  install -Dm755 "tabex_v${pkgver}_linux_amd64/tabex" \
    "${pkgdir}/usr/bin/tabex"
}
