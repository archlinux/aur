# Maintainer: Margret Riegert <margret at eowyn net>
# Maintainer: Scott Shawcroft <scott at tannewt dot org>

pkgname=oss-cad-suite-build-bin
_pkgver=2023-11-06
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
sha256sums_x86_64=('9eda85f0f36613f765cba26b1ee5cb87f3adb8d370a1f33be3aeb48225661d93')
sha256sums_arm=('247df7326da4fc62118c499598c22b800ac54d7ba346ba47d71217c6ba4ef1d6')
sha256sums_aarch64=('60d8bf8bb9d181b740558a9342bb8569d7f9b485607248017c8593da5e5172ba')
install='path.install'

replaces=('fpga-toolchain-bin')

package() {
    rsync -a "$srcdir/oss-cad-suite" "$pkgdir/opt/" --chmod=755 --exclude README --exclude license
    mkdir -p "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
    cp "$srcdir/oss-cad-suite/license/"* "$pkgdir/usr/share/licenses/oss-cad-suite-build/"
}
