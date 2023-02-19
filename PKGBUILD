# Maintainer: Michael Riegert <michael at eowyn net>
# Maintainer: Scott Shawcroft <scott at tannewt dot org>

pkgname=oss-cad-suite-build-bin
_pkgver=2023-02-19
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Nightly builds of open-source FPGA tools"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/YosysHQ/oss-cad-suite-build"
license=('custom')
depends=('python' 'bash' 'rsync')

source=(path.install)
source_x86_64=($url/releases/download/$_pkgver/oss-cad-suite-linux-x64-$pkgver.tgz)
source_arm=($url/releases/download/$_pkgver/oss-cad-suite-linux-arm-$pkgver.tgz)
source_aarch64=($url/releases/download/$_pkgver/oss-cad-suite-linux-arm64-$pkgver.tgz)
sha256sums=('478fef6781eeda227e7b4b0a560ff9ab5b7a55ed5ba904eca84d69a3a473181e')
sha256sums_x86_64=('5d3cd5472d4a28f1bfa0d6e5433646a8e55a1fd1727d7358830aaced06e2c74a')
sha256sums_arm=('8f39fd717b4d840ce0e30581d748aa7e77c87aa5aeeae2fb87ccb5d3594c8626')
sha256sums_aarch64=('6d65b64d763bd757bb1793b574d8bdbba7db9371a73fe4141a131065c30e90d5')
install='path.install'

replaces=('fpga-toolchain-bin')

package() {
    rsync -a "$srcdir/oss-cad-suite" "$pkgdir/opt/" --chmod=755 --exclude README --exclude license
    mkdir -p "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
    cp "$srcdir/oss-cad-suite/license/"* "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
}
