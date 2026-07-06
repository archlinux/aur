# Maintainer: Kayque Pereira <kayquesousa02004@gmail.com>
pkgname=karnot
pkgver=0.1.0
pkgrel=1
pkgdesc="A Karnaugh map solver for simplifying boolean expressions"
arch=('x86_64')
url="https://github.com/kaypes/karnot"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glib2' 'hicolor-icon-theme')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kaypes/karnot/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('79353516f2d193f8bdd7adbfa64e3be2c107217a43e278a17fbe4867b54750c6')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/karnot "$pkgdir/usr/bin/karnot"
    install -Dm644 data/io.github.kaypes.Karnot.desktop \
        "$pkgdir/usr/share/applications/io.github.kaypes.Karnot.desktop"
    install -Dm644 data/io.github.kaypes.Karnot.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.kaypes.Karnot.metainfo.xml"
    install -Dm644 data/icons/hicolor/scalable/apps/io.github.kaypes.Karnot.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.kaypes.Karnot.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
