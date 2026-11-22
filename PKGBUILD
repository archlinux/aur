# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

pkgname=crum-bs-bin
_pkgname=crumbs
pkgver=0.8.4
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
sha256sums=('4c9774d9e82f4656cd74c5a120e86199d6a79977acce0970e20e67ca13ab3f14')
sha256sums_x86_64=('6a304a12563be3bec8781507a7d0aeefb654ac53ce47b8e9484c44f80cc35615')

package() {
    install -Dm755 "$_pkgname-$pkgver-$CARCH-linux-musl" "$pkgdir/usr/bin/$_pkgname"
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # uQ integration (inert without uQ): uq/README.md says what each file adds.
    install -Dm644 -t "$pkgdir/usr/share/uq/launcher/actions" uq/launcher/actions/*.appaction
    install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/crumbs" uq/pages/crumbs/*
}
