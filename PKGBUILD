pkgname=syncany-plugin-gui-git
pkgver=0.4.9.alpha.g2273832c
_pkgver=0.4.9-alpha
pkgrel=1
pkgdesc="Graphical User Interface for Syncany"
arch=(any)
url="http://www.syncany.org/"
license=('GPL3')
depends=('java-environment>=8' 'syncany')
source=("${pkgname}"::'git+https://github.com/syncany/syncany-plugin-gui.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "$(grep 'pluginVersion =' build.gradle | cut -d'"' -f2 | sed 's/-/./g').g$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    ./gradlew clean pluginjar -Pos=linux -Parch=x86_64
}

package() {
    install -Dm644 "${srcdir}/${pkgname}/build/libs/syncany-plugin-gui-linux-x86_64-${_pkgver}.jar" "${pkgdir}/usr/share/java/syncany/lib/syncany-plugin-gui-linux-x86_64-${_pkgver}.jar"
}
