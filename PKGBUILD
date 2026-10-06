# Maintainer: Denis "RinWate" Egorov <rinwate@yandex.ru>
# Prebuilt binary package: downloads the release asset instead of
# compiling. Since 0.3.0 the release ships a pacman package as the
# Linux/x86_64 asset (xca-rs-$pkgver-x86_64.pkg.tar.zst); this PKGBUILD
# re-packs its payload. The pacman metadata inside (.PKGINFO/.MTREE/
# .BUILDINFO) is skipped — only the usr/ tree is installed.
# After changing pkgver: run `updpkgsums`, build-test with `makepkg -sf`,
# then refresh .SRCINFO (makepkg --printsrcinfo).

pkgname=xca-rs-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="XCA rewritten in Rust with GTK4 and GOST support — prebuilt binary"
arch=('x86_64')
url="https://github.com/RinWate/xca-rs"
license=('GPL-2.0-or-later')
depends=('gtk4' 'libadwaita' 'openssl' 'openssl-gost-engine' 'glib2' 'glibc' 'poppler')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/xca-rs-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('25425abb2d5d3342106bb861165b3513e74c69d374423272d1b8e5143358f481')

package() {
    install -Dm755 usr/bin/xca-rs -t "$pkgdir/usr/bin"
    install -Dm644 usr/share/applications/org.xca.rs.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 usr/share/icons/hicolor/scalable/apps/org.xca.rs.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
