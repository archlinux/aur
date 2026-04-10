# Maintainer: Anand Pant

pkgname=nyrra-signals-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="Signal exploration TUI"
arch=('x86_64')
url="https://github.com/nyrra-labs/nyrra-signals"
install="${pkgname}.install"
makedepends=('github-cli')
provides=('nyrra-signals')
conflicts=('nyrra-signals')

# Public PKGBUILD, private release asset. Users need GitHub access to the org.
_release_asset='nyrra-signals_v0.0.11_linux_amd64.tar.gz'
_asset="nyrra-signals_v${pkgver}_linux_amd64.tar.gz"
_sha256='b76deb8ab9063e4b4987af2d1e3c5fea0682b721726f46dd3f1a39124bb39d9d'

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
