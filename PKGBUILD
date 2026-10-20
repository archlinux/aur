# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=craft-launcher-bin
_pkgname=craft-launcher
_distname=artcraft-launcher
pkgver=0.6.0
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
sha256sums_x86_64=('612df2a99aa00f6a0598f007fd67509ea08afb25aec9565176ae817100023d2f')
sha256sums_aarch64=('c2c12e5b492790b167528be2503137ee34b660bc39fa62f4a1910693118ec896')

package() {
	local _root="$srcdir/$_distname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_distname" "$pkgdir/usr/bin/$_distname"
	ln -s "$_distname" "$pkgdir/usr/bin/$_pkgname"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_distname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_distname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 "$_root/share/doc/$_distname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}