# Maintainer: yaroslav <proninyaroslav@mail.ru>

pkgname=jd-core-java
pkgver=1.2
pkgrel=1
pkgdesc='A thin-wrapper for the Java Decompiler'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('java-environment')
makedepends=('git' 'mercurial')
provides=('jd-core')
source=("${pkgname}"::"git://github.com/nviennot/jd-core-java.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    ./gradlew build
}

package() {
    cd "${srcdir}/${pkgname}/build/libs"
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -d "${pkgdir}/usr/bin"
    echo -e "#!/bin/sh\nexec java -jar /usr/share/java/${pkgname}/${pkgname}.jar" '"$@"' > "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
