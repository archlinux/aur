# Maintainer: Denis "RinWate" Egorov <rinwate@yandex.ru>
# Prebuilt binary package: downloads the release asset instead of
# compiling. The binary is built by CI-less release automation from the
# same tag; sources live in the project repository (GPL).
# Before the first upload: refresh .SRCINFO (makepkg --printsrcinfo).

pkgname=xca-rs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="XCA rewritten in Rust with GTK4 and GOST support — prebuilt binary"
arch=('x86_64')
url="https://github.com/RinWate/xca-rs"
license=('GPL-2.0-or-later')
depends=('gtk4' 'libadwaita' 'openssl' 'openssl-gost-engine' 'glib2' 'glibc' 'poppler')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/xca-rs-$pkgver-x86_64.pkg.tar.zst")
sha256sums=('e8c4122d1f9f58e14a172f00048f89ed9683745d336531c4ddffcc485d54bd83')

_dir="xca-rs-$pkgver-x86_64"

package() {
    cd "$_dir"
    install -Dm755 xca-rs -t "$pkgdir/usr/bin"
    install -Dm644 org.xca.rs.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 org.xca.rs.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
