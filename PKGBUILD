# Maintainer: Michael Riegert <michael at eowyn net>
# Maintainer: Scott Shawcroft <scott at tannewt dot org>

pkgname=oss-cad-suite-build-bin
_pkgver=2023-04-30
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
sha256sums_x86_64=('0c069fabc1d0172f0105dcda93e4989280effd142b203716a8689d0d996393fe')
sha256sums_arm=('572fb4e2edd278f1472856e061049f6ab72709c39b87015389d31f6c3e56b4b2')
sha256sums_aarch64=('762ef25018357af3a65a3d0127c48331cbee9098569ee9358293b1073609c37f')
install='path.install'

replaces=('fpga-toolchain-bin')

package() {
    rsync -a "$srcdir/oss-cad-suite" "$pkgdir/opt/" --chmod=755 --exclude README --exclude license
    mkdir -p "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
    cp "$srcdir/oss-cad-suite/license/"* "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
}
