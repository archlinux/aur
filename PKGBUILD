# Maintainer: Vilém Hořínek <vhorinek@vhorinek.cz>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Anton Perstenev <anton.perstenyov@gmail.com>

# Created by modifying existing PKGBUILD from jdk18-openj9-bin

pkgname=jdk20-openj9-bin
pkgver=20.0.2.0
pkgrel=2
_jdk_version=20.0.2
_jdk_patch=9
_j9_version=0.40.0
pkgdesc="IBM Semeru OpenJ9 with openjdk20"
arch=('x86_64')
url="https://developer.ibm.com/languages/java/semeru-runtimes/"
license=('GPL')
depends=('java-runtime-common' 'java-environment-common' 'ca-certificates-utils' 'nss')
install="install_jdk20-openj9.sh"

provides=(
'java-environment=20'
'java-runtime=20'
'java-runtime-headless=20'
)

makedepends=('coreutils' 'bash')
source=("https://github.com/ibmruntimes/semeru20-binaries/releases/download/jdk-${_jdk_version}+${_jdk_patch}_openj9-${_j9_version}/ibm-semeru-open-jdk_x64_linux_${_jdk_version}_${_jdk_patch}_openj9-${_j9_version}.tar.gz")
noextract=("ibm-semeru-open-jdk_x64_linux_${_jdk_version}_${_jdk_patch}_openj9-${_j9_version}.tar.gz")

sha256sums=('925b555050eb3ad9bcb444c4713f5bb221025ba9c309e95235d4b2e060c84ee0')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf ibm-semeru-open-jdk_x64_linux_${_jdk_version}_${_jdk_patch}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk-${_jdk_version}+${_jdk_patch}" "${pkgdir}/usr/lib/jvm/java-20-j9"
}
