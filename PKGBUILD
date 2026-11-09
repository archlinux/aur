# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=craft-launcher-bin
_pkgname=craft-launcher
_distname=artcraft-launcher
pkgver=0.17.0
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
conflicts=("$_pkgname" "$_distname" "artcraft-launcher-git")
options=('!strip')
source_x86_64=("$_distname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_distname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('bbf2b1b84f52bbae81f8723034cce2d5862f28664adb28787fb11e1d4b93b98a')
sha256sums_aarch64=('81a60694313a986accc5d61fe45c2cc57750485b776365a0c44406c52ee80192')

package() {
	local _root="$srcdir/$_distname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_distname" "$pkgdir/usr/bin/$_distname"
	ln -s "$_distname" "$pkgdir/usr/bin/$_pkgname"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_distname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_distname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 "$_root/share/doc/$_distname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}