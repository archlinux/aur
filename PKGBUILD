pkgname=jdk11-j9-bin
pkgver=11.0.11.0
_majver=$(sed 's/\.[^.]*$//' <<<${pkgver})
_minver=9
pkgrel=1
pkgdesc="IBM® SDK, Java Technology Edition, Version 11"
arch=('x86_64')
url="https://www.ibm.com/support/pages/java-sdk-downloads-version-110"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=11'
'java-runtime=11'
'java-runtime-headless=11'
)
makedepends=('coreutils' 'bash')
source=("install_${pkgver}.bin::https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/${pkgver}/linux/x86_64/ibm-java-jdk_x64_linux_${pkgver}-archive.bin")
sha256sums=('037363b1dd35d7b6a67137baf1c73589b4f7b4e177d40394897726ad6056babd')

build() {
    chmod +x install_${pkgver}.bin
    ./install_${pkgver}.bin -i silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR="${srcdir}/temp_install"
}

package() {
    mkdir -p "${pkgdir}/usr/lib/jvm"
    mv "${srcdir}/temp_install/jdk-${_majver}+${_minver}" "${pkgdir}/usr/lib/jvm/java-11-j9"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s ../../lib/jvm/java-11-j9/legal/openj9.jvm/license/license_en.txt "${pkgdir}/usr/share/licenses/jdk11-j9"
}

