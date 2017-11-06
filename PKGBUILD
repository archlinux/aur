pkgname=jdk9-openj9-bin
_pkgver_minor="181"
pkgver=9.${_pkgver_minor}
pkgrel=2
pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk9"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk9-openj9"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=9'
'java-runtime=9'
'java-runtime-headless=9'
)
makedepends=('coreutils' 'bash')
source=("https://github.com/AdoptOpenJDK/openjdk9-openj9-releases/releases/download/jdk-9%2B${_pkgver_minor}/OpenJDK9-OPENJ9_x64_Linux_jdk-${pkgver}.tar.gz")
noextract=("OpenJDK9-OPENJ9_x64_Linux_jdk-${pkgver}.tar.gz")
# https://github.com/AdoptOpenJDK/openjdk9-openj9-releases/releases/download/jdk-9%2B181/OpenJDK9-OPENJ9_x64_Linux_jdk-9.181.sha256.txt
# extract automatically?
sha256sums=('e0d31d25adb81005eea1ad1095f8d48c1df9da02c39d4b02b201c55f8bb4dca3')

package() {
    cd "$srcdir"
    
    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK9-OPENJ9_x64_Linux_jdk-${pkgver}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk-9+${_pkgver_minor}" "${pkgdir}/usr/lib/jvm/java-9-j9"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s "/usr/lib/jvm/java-9-j9/legal" "${pkgdir}/usr/share/licenses/java-9-j9"
    
}

