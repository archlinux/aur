# Maintainer: steadfasterX <steadfasterX [at] gmail -dot- com>
pkgname=jodin3-bin
pkgver=0.9.0
pkgrel=3
pkgdesc="JOdin3 allows you to flash Samsung firmware on Linux (pre-compiled jar)"
arch=('x86_64')
url="https://github.com/plaili/android-casual"
license=('LGPL3')
depends=('java11-openjfx' 'jre11-openjdk')
makedepends=('git')
optdepends=('heimdall' 'heimdall-git')
source=("https://github.com/plaili/android-casual/raw/master/dist/JOdin3CASUAL-${pkgver}.jar")
md5sums=('7f6f8b2f394944dcc6e8e3e04812b4be')
noextract=("JOdin3CASUAL-${pkgver}.jar")
_BINFIX=usr/bin
_MANDIR=usr/share/man
_MAN1DIR=${_MANDIR}/man1
_MAN1PAGE=jodin3.1
_USER=root
_GROUP=root
_ROOTDIR=$(pwd)

build(){
    cat > jodin3-starter.sh << _EOB
#!/bin/bash
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/bin/java
java -Xmx8096m --module-path /usr/lib/jvm/java-11-openjfx/lib/ --add-modules javafx.controls,javafx.fxml -jar /usr/share/${pkgname}/JOdin3CASUAL-${pkgver}.jar
_EOB
}

package() {
    mkdir -p $pkgdir/${_BINFIX} $pkgdir/$_MAN1DIR $pkgdir/usr/share/${pkgname} $pkgdir/usr/share/applications

    install -o ${_USER} -g ${_GROUP} -m 0755 $_ROOTDIR/jodin3.desktop $pkgdir/usr/share/applications/
    install -o ${_USER} -g ${_GROUP} -m 0755 jodin3-starter.sh $pkgdir/${_BINFIX}/JOdin3
    install -o ${_USER} -g ${_GROUP} -m 0644 JOdin3CASUAL-${pkgver}.jar $pkgdir/usr/share/${pkgname}

    install -m 644 $_ROOTDIR/odin-logo.jpg $pkgdir/usr/share/${pkgname}/
    install -m 644 $_ROOTDIR/${_MAN1PAGE} $pkgdir/${_MAN1DIR}/${_MAN1PAGE}

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m644 $_ROOTDIR/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

