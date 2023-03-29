# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=flemozi
pkgver=0.1.0
pkgrel=2
pkgdesc='An advanced Emoji Picker written with Flutter'
arch=('x86_64')
url="https://github.com/KRTirtho/$pkgname"
license=('GPL3')
makedepends=('flutter' 'rustup')
depends=('xdg-user-dirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a7d6c977ff18da98e6104e50a97a68a2b9a5e2a3d0acdbcc22af4294b4418b3c')

prepare(){
    cd "$pkgname-$pkgver"

    rustup install stable
    rustup default stable

    flutter pub get
    flutter config --enable-linux-desktop

    cp .env.example .env
}

build() {
    cd "$pkgname-$pkgver"
    flutter build linux --no-pub
}

package() {
    cd "$pkgname-$pkgver"
    install -dm 755 "$pkgdir"/usr/bin/ "$pkgdir"/opt

    cp -rdp --no-preserve=ownership build/linux/x64/release/bundle/ "$pkgdir"/opt/$pkgname/

    ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
