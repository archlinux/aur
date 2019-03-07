# Maintainer: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody
# Contributor: milgner
# Contributor: alkalien

pkgname=jdk8-openj9-bin
pkgver=8.${_pkgver_minor}
pkgrel=1

_pkgver_minor="202"
_pkgver_build="08"
_j9_version="0.12.0"

pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk8"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk8-openj9"
license=('GPL')
depends=('java-runtime-common' 'java-environment-common' 'ca-certificates-utils' 'nss')
# conflicts=('jdk8-j9-bin')
replaces=('jdk8-j9-bin')

provides=(
'java-environment=8'
'java-runtime=8'
'java-runtime-headless=8'
)

makedepends=('coreutils' 'bash')
source=("https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u${_pkgver_minor}-b${_pkgver_build}/OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz")
noextract=("OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz")

# https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u202-b08/OpenJDK8U-jdk_x64_linux_openj9_8u202b08_openj9-0.12.0.tar.gz.sha256.txt
sha256sums=('533dcd8d9ca15df231a1eb392fa713a66bca85a8e76d9b4ee30975f3823636b7')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}
