# Maintainer: Anand Pant

pkgname=nyrra-signals-bin
pkgver=0.0.14
pkgrel=1
pkgdesc="Signal exploration TUI"
arch=('x86_64')
url="https://github.com/nyrra-labs/nyrra-signals"
install="${pkgname}.install"
makedepends=('github-cli')
provides=('nyrra-signals')
conflicts=('nyrra-signals')

# Public PKGBUILD, private release asset. Users need GitHub access to the org.
_release_asset='nyrra-signals_v0.0.14_linux_amd64.tar.gz'
_asset="nyrra-signals_v${pkgver}_linux_amd64.tar.gz"
_sha256='857929d0594a6ca49e5d8d32e5a2863edd641b733b9f27174de93e4a6f62c9ba'

prepare() {
  gh release download "v${pkgver}" \
    --repo nyrra-labs/nyrra-signals \
    --pattern "${_release_asset}" \
    --dir . --clobber

  echo "${_sha256}  ${_release_asset}" | sha256sum -c

  if [[ "${_release_asset}" != "${_asset}" ]]; then
    bsdtar -xf "${_release_asset}"
  fi

  tar xzf "${_asset}"
}

package() {
  install -Dm755 "nyrra-signals_v${pkgver}_linux_amd64/nyrra-signals" \
    "${pkgdir}/usr/bin/nyrra-signals"
}
