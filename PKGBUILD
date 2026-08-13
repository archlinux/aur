# Maintainer: Bujju (https://github.com/BujjuIsABee)
pkgname=shimelinux
pkgver=1.2.1
pkgrel=1
pkgdesc="An unofficial Linux port of Shimeji-ee Desktop Pet"
arch=(any)
url="https://github.com/BujjuIsABee/shimelinux"
license=('BSD-3-Clause')
depends=('libappindicator' 'java-runtime>=21')
makedepends=('git' 'gradle' 'java-environment>=21' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BujjuIsABee/shimelinux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3fd7d54718a8d8fb29a039a370bc314ac5f72ff32a71ff958f85abbaa25cabe9')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Build
    ./gradlew build
}

package() {
    # Install
    install -Dm644 "$srcdir/$pkgname-$pkgver/build/libs/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname.jar"
    install -Dm755 "$srcdir/$pkgname-$pkgver/shimelinux.sh" "$pkgdir/usr/bin/$pkgname"

    # Create desktop entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "$srcdir/$pkgname-$pkgver/shimelinux.desktop" -t "$pkgdir/usr/share/applications/"

    # Install licenses
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE-ORIGINAL" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
