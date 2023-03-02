# Maintainer: Michael Riegert <michael at eowyn net>
# Maintainer: Scott Shawcroft <scott at tannewt dot org>

pkgname=oss-cad-suite-build-bin
_pkgver=2023-03-02
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
sha256sums_x86_64=('935fa1e464a976bf7c65d5b45bf025dc1767fd8131ac042d010bb5c38058cee7')
sha256sums_arm=('1f9601248dbe720287bf041ef4c76dcd2ca3d139d80817e8e6141833fd2a811a')
sha256sums_aarch64=('55870e91495663cac8c098f96ca5a2a4ef167a5c5b11480b16adabb984614ebf')
install='path.install'

replaces=('fpga-toolchain-bin')

package() {
    rsync -a "$srcdir/oss-cad-suite" "$pkgdir/opt/" --chmod=755 --exclude README --exclude license
    mkdir -p "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
    cp "$srcdir/oss-cad-suite/license/"* "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
}
