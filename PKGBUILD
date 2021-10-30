# Maintainer: Deckweiss <Deckweiss75@gmail.com>

pkgname=drawj2d
pkgver=1.3.0
pkgrel=1
pkgdesc="Drawj2d creates technical line drawings using a descriptive language. It writes pdf, svg, eps, emf and dxf vector graphics or png images. It runs on all platforms that run Java. It is inspired by Asymptote but with a tcl-like syntax and 2D only."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://sourceforge.net/projects/$pkgname"
license=('GPLv2')
depends=('java-runtime>=8')
makedepends=(
    'ant'
    'jdk11-openjdk=11.0.12.u7-1'
)
conflicts=('drawj2d')
provides=('drawj2d')
source=("$pkgname-$pkgver.tar.gz::https://iweb.dl.sourceforge.net/project/$pkgname/$pkgver/Drawj2d-$pkgver.src.tar.gz")
sha256sums=('fd437d1f13fa09d0c65da82698e919f6c3c94c6109432152a175bc6ef8addb4b')

prepare() {
    cd "$srcdir"
    rm -rf build
    rm -rf dist
    rm -f *.tar.gz
    rm -f *.zip
}

build() {

    cd "$srcdir/Drawj2d"
    JAVACMD=/usr/lib/jvm/java-11-openjdk/bin/java ant -f build.xml
}

package() {
    cd "$srcdir/Drawj2d/dist"
    mkdir /usr/share/java/drawj2d
    cp drawj2d.jar /usr/share/java/drawj2d/

    touch /usr/bin/drawj2d
    echo "#! /bin/bash" >> /usr/bin/drawj2d
    echo "exec /usr/bin/java -jar '/usr/share/java/drawj2d/drawj2d.jar' \"\$@\"" >> /usr/bin/drawj2d
    chmod +x /usr/bin/drawj2d
}
