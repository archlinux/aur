# Maintainer: Janosch Dobler <janosch.dobler@gmx.de>
pkgname=jdrivesync
pkgver=0.2.4
pkgrel=1
pkgdesc="jdrivesync is a simple command line tool that synchronizes a local file system structure to your Google Drive (and back)"
arch=('any')
url="https://github.com/siom79/jdrivesync"
license=('Apache')
depends=('java-runtime=8')
options=()
source=("https://github.com/siom79/jdrivesync/releases/download/$pkgname-$pkgver/$pkgname-$pkgver-jar-with-dependencies.jar")
noextract=("$pkgname-$pkgver-jar-with-dependencies.jar")
md5sums=('2ea43b637d0be9cb6ed1a821975c0904')

JARNAME=$pkgname-$pkgver-jar-with-dependencies.jar

build() {
    echo "#!/bin/sh" > jdrivesync
    echo "exec /usr/lib/jvm/java-8-openjdk/jre/bin/java -jar '/usr/share/java/jdrivesync/$JARNAME'"' "$@"' >> jdrivesync
}

package() {
    cd "${srcdir}"
    install -Dm644 $JARNAME "${pkgdir}/usr/share/java/jdrivesync/$JARNAME"
    install -Dm755 jdrivesync "${pkgdir}/usr/bin/jdrivesync"
}
