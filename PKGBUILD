# Maintainer: John Regan <john@jrjrtech.com>

pkgname=dvbinspector
pkgver=1.20.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="DVB analyzer, written in java"
url="https://github.com/EricBerendsen/dvbinspector"
license=("GPL-3.0-or-later")
arch=('any')
depends=('java-runtime>=21')
makedepends=('maven' 'jdk21-openjdk')

source=("$url/archive/refs/tags/release_${_pkgver}.tar.gz"
        "dvbinspector.sh"
        )
sha256sums=('ec7767e0d33e2b96738e2e317da09d138ecd132c70122faaab54161e7c9e934c'
            'af320db41a920b3838a7598c8d0712352a59081112015f893f7b713d407773e4'
           )

build() {
    cd "${pkgname}-release_${_pkgver}"
    export PATH="/usr/lib/jvm/java-21-openjdk/bin/:$PATH"
    export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"

    mvn package
}

package() {
    cd "${pkgname}-release_${_pkgver}"

    install -vDm755 "$srcdir/dvbinspector.sh" "$pkgdir/usr/bin/$pkgname"
    install -vDm644 "target/DVBinspector-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
