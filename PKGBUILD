# Maintainer: Vladimir Maryasov <mx.wg@yandex.ru>
#
# Prebuilt (compiler-free) package of the maryasov modified Microsoft Edit.
# The binary is produced by the `release` GitHub Actions workflow in the fork
# (branch `mk`) and published to the rolling `nightly` GitHub Release:
#   https://github.com/maryasov/edit/releases/tag/nightly
#
# Install:  makepkg -si
# Update:   after a new `mk` push, refresh checksums with `updpkgsums`
#           (or `makepkg -g >> PKGBUILD`), then `makepkg -si`.
#           For a no-fuss rolling setup you may set sha256sums to 'SKIP'
#           (accepts any content from your own CI).

_pkgbase=msedit
pkgname="$_pkgbase-mod-bin"
pkgver=2.0.0.r505.gfd2e67a
pkgrel=1
pkgdesc="A simple editor for simple needs (Microsoft Edit) — maryasov modified build (prebuilt)"
arch=('x86_64')
url="https://github.com/maryasov/edit"
license=('MIT')
depends=('icu')
provides=("$_pkgbase")
conflicts=("$_pkgbase" "$_pkgbase-git" "$_pkgbase-mod-git")
source_x86_64=("$_pkgbase-x86_64.tar.zst::https://github.com/maryasov/edit/releases/download/nightly/msedit-x86_64.tar.zst")
sha256sums_x86_64=('b87d2931b1e7e3a35de378d15cbfaf94680c9fe3f7ca1ba0a166d17913b5c273')

package() {
	cd "$srcdir"
	install -Dm755 msedit          "$pkgdir/usr/bin/$_pkgbase"
	install -Dm644 msedit.1        "$pkgdir/usr/share/man/man1/$_pkgbase.1"
	install -Dm644 msedit.desktop  "$pkgdir/usr/share/applications/$_pkgbase.desktop"
	install -Dm644 msedit.svg      "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgbase.svg"
	install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}