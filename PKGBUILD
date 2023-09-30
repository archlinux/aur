# Maintainer: Margret Riegert <margret at eowyn net>
# Maintainer: Scott Shawcroft <scott at tannewt dot org>

pkgname=oss-cad-suite-build-bin
_pkgver=2023-09-30
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
sha256sums_x86_64=('73b29f79ac0847ce98fcd7b7eebfff200e340ef9ad6fdfdf4f3a7a80b94f0471')
sha256sums_arm=('0a50616a3063bbf5dc7902140e728c32284846bc13673cce291cbf47a3b49d29')
sha256sums_aarch64=('470e8de8d5950a0a747678c8393439a73c6ddac259f45be0de3cbd6f447ada06')
install='path.install'

replaces=('fpga-toolchain-bin')

package() {
    rsync -a "$srcdir/oss-cad-suite" "$pkgdir/opt/" --chmod=755 --exclude README --exclude license
    mkdir -p "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
    cp "$srcdir/oss-cad-suite/license/"* "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
}
