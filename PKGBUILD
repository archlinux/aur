# Maintainer: Luca Corbatto <luca-arch@corbatto.de>
_pkgname=UberSpatchBoard
pkgname=uberspatchboard-git
pkgver=1.0.alpha.3.r0.g58b7406
pkgrel=1
pkgdesc="The UberSpatchBoard is the ultimate fuelrats spatching aid."
arch=(i686 x86_64)
url="https://github.com/targodan/UberSpatchBoard"
license=('MIT')
depends=('java-runtime>=8')
makedepends=('java-runtime>=8')
install=$_pkgname.install
source=(
    'git://github.com/targodan/UberSpatchBoard.git'
    'UberSpatchBoard.desktop'
    'UberSpatchBoard.sh')
sha256sums=('SKIP'
            '2cb520230edc0485b476eb4a1f50c356a0e8bc4f3611f587920cb0d217207bc8'
            '5270d22ccb0d66cc2e265dc90d4aabe8e6674c076b6d62d78da63a041530f6a0')

build() {
    cd "$srcdir/$_pkgname"

    ./gradlew fatJar
}

package() {
    install -D -m 0755 "UberSpatchBoard.sh" "$pkgdir/usr/bin/UberSpatchBoard"
    install -D -m 0644 "UberSpatchBoard.desktop" "$pkgdir/usr/share/applications/UberSpatchBoard.desktop"

    cd "$srcdir/$_pkgname"

    mv build/libs/UberSpatchBoard-all-*.jar "build/libs/UberSpatchBoard.jar"
    install -D -m 0755 "build/libs/UberSpatchBoard.jar" "$pkgdir/usr/share/java/UberSpatchBoard/UberSpatchBoard.jar"
}

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}
