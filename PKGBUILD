# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

pkgname=crum-bs-bin
_pkgname=crumbs
pkgver=0.5.0
pkgrel=1
pkgdesc="Find and remove app leftovers, caches and system bloat (static binary)"
arch=('x86_64')
url="https://github.com/asafelobotomy/crumbs"
license=('GPL-3.0-or-later')
optdepends=('uq: the Storage and cleanup page in Settings and an "Uninstall…" entry in the app menus')
# Installs /usr/bin/crumbs, as does the unrelated AUR package `crumbs`.
provides=("crum-bs=$pkgver")
conflicts=('crum-bs' 'crumbs')
# The release binary is already stripped, and static.
options=('!strip' '!debug')
# The source tarball (the one crum-bs builds) carries the licence and the uQ files. makepkg
# unpacks it to $_pkgname-$pkgver/, so the binary has a different name.
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
source_x86_64=("$_pkgname-$pkgver-$CARCH-linux-musl::$url/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH-linux-musl")
sha256sums=('d6a81ab2349af06ed27d77e58e47ca06e5dbd6b51ad486d8b10c50fe4879f40a')
sha256sums_x86_64=('7c538bb3778448e3a6b6ab46b3de0efb91af12990d7735d910552ffdd9d86c7d')

package() {
    install -Dm755 "$_pkgname-$pkgver-$CARCH-linux-musl" "$pkgdir/usr/bin/$_pkgname"
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # uQ integration (inert without uQ): uq/README.md says what each file adds.
    install -Dm644 -t "$pkgdir/usr/share/uq/launcher/actions" uq/launcher/actions/*.appaction
    install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/crumbs" uq/pages/crumbs/*
}
