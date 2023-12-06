pkgname=jdk8-j9-bin
pkgver=8.0.8.15
_pkgver=$(sed -e 's/\./-/2' <<<${pkgver})
pkgrel=1
pkgdesc="IBM® SDK, Java Technology Edition, Version 8"
arch=('x86_64')
url="https://www.ibm.com/support/pages/java-sdk-downloads-version-80"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=8'
'java-runtime=8'
'java-runtime-headless=8'
)
makedepends=('coreutils' 'bash')
source=("install_${pkgver}.bin::https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/${pkgver}/linux/x86_64/ibm-java-sdk-${_pkgver}-x86_64-archive.bin")
sha256sums=('7ccef7b1efc09c73b9afc68ba3f8012a554cf2eff0d60655ffb7dafe3c3f562a')

package() {
	cd "$srcdir"
    chmod +x install_${pkgver}.bin
    mkdir -p "${pkgdir}/usr/lib/jvm/java-8-ibmj9"
    ./install_${pkgver}.bin -i silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR="${pkgdir}/usr/lib/jvm/java-8-ibmj9"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s ../../lib/jvm/java-8-ibmj9/license_en.txt "${pkgdir}/usr/share/licenses/jdk8-ibmj9"
}

