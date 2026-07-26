# Maintainer: Anand Pant

pkgname=meshix-cli-bin
pkgver=0.0.27
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
_sha256='f881387e2c5a6d8701a1e3a3037546d57911ca7e9ec14e65b3e763489fbac965'

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
