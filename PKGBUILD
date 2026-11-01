# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=craft-launcher-bin
_pkgname=craft-launcher
_distname=artcraft-launcher
pkgver=0.12.0
pkgrel=1
pkgdesc="The Craft App Launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('Apache-2.0' 'MIT')
depends=('dbus' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland')
depends_aarch64=('libxcb')
optdepends=('flatpak: install Craft apps')
optdepends_aarch64=('vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname" "$_distname")
conflicts=("$_pkgname" "$_distname")
options=('!strip')
source_x86_64=("$_distname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_distname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('392476515090a48e07f28ce33ade5143096411fd34cea84e1cc6c0019775efb5')
sha256sums_aarch64=('22b1188c744030f16d9e17c24d46b554ba87576f651c641d9d6aac55ea1233f9')

package() {
	local _root="$srcdir/$_distname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_distname" "$pkgdir/usr/bin/$_distname"
	ln -s "$_distname" "$pkgdir/usr/bin/$_pkgname"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_distname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_distname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 "$_root/share/doc/$_distname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}