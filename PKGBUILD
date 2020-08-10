# Maintainer: Midna
pkgname=jdk7r1-j9-bin
_pkgver='7.1-4.70'
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="IBM® SDK, Java Technology Edition, Version 7 Release 1"
arch=('x86_64')
url="https://developer.ibm.com/javasdk/downloads/sdk7r1/"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=7'
'java-runtime=7'
'java-runtime-headless=7'
)
makedepends=('coreutils' 'bash')
source=("install-${_pkgver}.bin::https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/${pkgver}/linux/x86_64/ibm-java-sdk-${_pkgver}-x86_64-archive.bin")
sha256sums=('48205a70e97607a175a6c94c8c669501933687f59e3131a7b86e606d4e898937')

package() {
	cd "$srcdir"
    chmod +x install-${_pkgver}.bin
    mkdir -p "${pkgdir}/usr/lib/jvm/java-7r1-j9"
    ./install-${_pkgver}.bin -i silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR="${pkgdir}/usr/lib/jvm/java-7r1-j9"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s ../../lib/jvm/java-7r1-j9/license_en.txt "${pkgdir}/usr/share/licenses/jdk7r1-j9"
}

