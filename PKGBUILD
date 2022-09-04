pkgname=kurento-module-creator
pkgver=6.17.0
pkgrel=1
pkgdesc="Helper for build of Kurento media server"
arch=(any)
url="https://github.com/Kurento/kurento-module-creator"
license=(apache)
depends=("java-runtime")
makedepends=("java-environment" "maven")
source=("git+https://github.com/Kurento/$pkgname.git#tag=$pkgver")
sha256sums=(SKIP)

build() {
    cd "$srcdir/$pkgname"
    mvn package
}

package() {
    rm -rf "$pkgdir"/usr
    mkdir -p "$pkgdir"/usr/{bin,"share/cmake/Modules"}
    cp "$srcdir/$pkgname"/{target/kurento-module-creator-jar-with-dependencies.jar,scripts/kurento-module-creator} "$pkgdir"/usr/bin
    cp "$srcdir/$pkgname"/target/classes/FindKurentoModuleCreator.cmake "$pkgdir/usr/share/cmake/Modules"
}
