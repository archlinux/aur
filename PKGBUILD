# Maintainer: Anand Pant

pkgname=meshix-cli-bin
pkgver=0.0.25
pkgrel=1
pkgdesc="Meshix CLI for run inspection and generation workflows"
arch=('x86_64')
url="https://github.com/shpitdev/meshix-mono"
license=('LicenseRef-proprietary')
install="${pkgname}.install"
makedepends=('github-cli')
depends=('nodejs')
provides=('meshix-cli')
conflicts=('meshix-cli')

# Public PKGBUILD, private release asset. Users need GitHub access to the shpitdev org.
_release_version="${pkgver//_/-}"
_asset="meshix-cli_v${_release_version}_linux_amd64.tar.gz"
_sha256='329c4b0dfa3f7748fad284455e7193339fcc5b537b615472ba5e61c937a6eece'

prepare() {
  gh release download "meshix-cli-v${_release_version}" \
    --repo shpitdev/meshix-mono \
    --pattern "${_asset}" \
    --dir . --clobber

  echo "${_sha256}  ${_asset}" | sha256sum -c
  tar xzf "${_asset}"
}

package() {
  install -Dm755 "meshix-cli_v${_release_version}_linux_amd64/meshix-cli" \
    "${pkgdir}/usr/bin/meshix-cli"
}
