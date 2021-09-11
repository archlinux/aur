pkgname=jdk11-j9-bin
pkgver=11.0.12.0
_majver=$(sed 's/\.[^.]*$//' <<<${pkgver})
_minver=7
pkgrel=1
pkgdesc="IBM®Semeru Runtime Certified Edition, Version 11"
arch=('x86_64')
url="https://www.ibm.com/semeru-runtimes/downloads?license=IBM"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=11'
'java-runtime=11'
'java-runtime-headless=11'
)
makedepends=('coreutils' 'bash')
source=("install_${pkgver}.bin::https://github.com/ibmruntimes/semeru11-binaries/releases/download/jdk-${pkgver}-certified/ibm-semeru-certified-jdk_x64_linux_${pkgver}-archive.bin")
sha256sums=('4691610316eb4a205557e3aa7d6d84caa1f140a8e584eaaef5ecbcc99378c0fd')

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

