# Maintainer: Denis "RinWate" Egorov <rinwate@yandex.ru>
# Prebuilt binary package: downloads the release asset instead of
# compiling. The binary is built by CI-less release automation from the
# same tag; sources live in the project repository (GPL).
# Before the first upload: refresh .SRCINFO (makepkg --printsrcinfo).

pkgname=xca-rs-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="XCA (X Certificate and Key Management) rewritten in Rust with GTK4 and GOST support — prebuilt binary"
arch=('x86_64')
url="https://github.com/RinWate/xca-rs"
license=('GPL-2.0-or-later')
depends=('gtk4' 'libadwaita' 'openssl' 'openssl-gost-engine' 'glib2' 'glibc')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/xca-rs-$pkgver-x86_64.tar.gz")
sha256sums=('26194f368b443ac4901c17ee2c24f4958b85e4dd819808c02a370468b9e1c15c')

_dir="xca-rs-$pkgver-x86_64"

package() {
    cd "$_dir"
    install -Dm755 xca-rs -t "$pkgdir/usr/bin"
    install -Dm644 org.xca.rs.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 org.xca.rs.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
