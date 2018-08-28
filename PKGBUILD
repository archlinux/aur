# Maintainer: WFCody (Jens Staal <staal1978@gmail.com>)
# Contributor: Myrddin (Myrddin <darknesseatsall@aol.com>)
pkgname=jdk10-openjdk-openj9-bin
_pkgver_minor="0.2.13"
_pkgver_split="0.2"
_pkgver_build="13"
_pkgver_minweb="0.2%2B13"
_openj_ver="0.9.0"
_majver_java="10"
pkgver=${_majver_java}.${_pkgver_split}.u${_pkgver_build}
_pkgsum_name="OpenJDK${_majver_java}-OPENJ9_x64_Linux_jdk-${pkgver}_openj9-${_openj_ver}.sha256.txt"
_pkgsum_sha256="wget -q https://github.com/AdoptOpenJDK/openjdk10-openj9-releases/releases/download/jdk-${_majver_java}.${_pkgver_minweb}_openj9-${_openj_ver}/${_pkgsum_name} && cut -d' ' -f1 ${_pkgsum_name}"
pkgrel=1
pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk10"
arch=('x86_64')
url="https://adoptopenjdk.net/releases.html?variant=openjdk10&jvmVariant=openj9#x64_linux"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=10'
'java-runtime=10'
'java-runtime-headless=10'
)
makedepends=('coreutils' 'bash' 'wget')
source=("https://github.com/AdoptOpenJDK/openjdk10-openj9-releases/releases/download/jdk-${_majver_java}.${_pkgver_minweb}_openj9-${_openj_ver}/OpenJDK${_majver_java}-OPENJ9_x64_Linux_jdk-${_majver_java}.${_pkgver_minor}_openj9-${_openj_ver}.tar.gz")
noextract=("OpenJDK${_majver_java}-OPENJ9_x64_Linux_jdk-${pkgver}_openj9-${_pkgver_minweb}.tar.gz")
# https://github.com/AdoptOpenJDK/openjdk9-openj9-releases/releases/download/jdk-9%2B181/OpenJDK9-OPENJ9_x64_Linux_jdk-9.181.sha256.txt
# extract automatically? [bash -c "${_pkgsum_sha256}"] Could this work?
sha256sums=('1ef0dab3853b2f3666091854ef8149fcb85970254558d5d62cfa9446831779d1')

package() {
    cd "$srcdir"
    
    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK${_majver_java}-OPENJ9_x64_Linux_jdk-${_majver_java}.${_pkgver_minor}_openj9-${_openj_ver}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk-${_majver_java}.${_pkgver_split}+${_pkgver_build}" "${pkgdir}/usr/lib/jvm/java-${_majver_java}-j9"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s "/usr/lib/jvm/java-${_majver_java}-j9/legal" "${pkgdir}/usr/share/licenses/java-${_majver_java}-j9"
    
}

