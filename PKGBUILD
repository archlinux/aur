# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

pkgname=crum-bs-bin
_pkgname=crumbs
pkgver=0.8.0
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
sha256sums=('2140c728ec419aa3873fc862f5c8f8e7386b28abcc687d046fec533156b61ab8') # filled in by scripts/release.sh
sha256sums_x86_64=('eb442c29a6ffb3578fdd873885f3498c63b99d626c5edb2cf038d0315a0e398f') # filled in by scripts/release.sh

package() {
    install -Dm755 "$_pkgname-$pkgver-$CARCH-linux-musl" "$pkgdir/usr/bin/$_pkgname"
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # uQ integration (inert without uQ): uq/README.md says what each file adds.
    install -Dm644 -t "$pkgdir/usr/share/uq/launcher/actions" uq/launcher/actions/*.appaction
    install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/crumbs" uq/pages/crumbs/*
}
