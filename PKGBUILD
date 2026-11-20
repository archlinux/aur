# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
# Maintainer: Luca Giugliardi <lukeemhigh plus dev at protonmail dot com>
# Maintainer: Sebastian Steinbeißer <sebastian dot steinbeisser at googlemail dot com>

pkgname='docker-scout'
pkgver=1.30.0
pkgrel=1
pkgdesc="Docker Scout is a set of software supply chain features integrated into Docker's user interfaces and command line interface (CLI)."
url='https://github.com/docker/scout-cli'
arch=('aarch64' 'x86_64')
license=('PROPRIETARY')

bump_version() {
  # usage: bash -c 'source PKGBUILD && bump_version new_version_number'
  [[ -n $1 ]] || {
    echo "usage: bump_version new_version_number" >&2
    return 1
  }

  # update pkgver and reset pkgrel to 1
  sed -Ei \
    -e "s/^pkgver=.*/pkgver=$1/" \
    -e "s/^pkgrel=.*/pkgrel=1/" \
    PKGBUILD
  # update the checksums
  updpkgsums
  # recreate the SRCINFO
  makepkg --printsrcinfo >.SRCINFO
}

source_aarch64=("${pkgname}_${pkgver}_arm64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_amd64.tar.gz")

sha256sums_aarch64=('4396c268e310d692e2f1aeb41945e7acbb1829e0ab3d938f0bc9304de70cffaf')
sha256sums_x86_64=('bd8d24896d2aa0f9e01d25830ac53cfd416a3254f8fbfce2cb10bcd7a1afe152')

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
