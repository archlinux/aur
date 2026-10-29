# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=craft-launcher-bin
_pkgname=craft-launcher
_distname=artcraft-launcher
pkgver=0.10.0
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
sha256sums_x86_64=('0fe6f6a59e594a9d3f599db41aac79f38013a0bf2943f8fdddf825626c425837')
sha256sums_aarch64=('09a3084679090f0c72a2f3a9aac23bfe255f2591237508e636fa8d8c2b5a8633')

package() {
	local _root="$srcdir/$_distname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_distname" "$pkgdir/usr/bin/$_distname"
	ln -s "$_distname" "$pkgdir/usr/bin/$_pkgname"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_distname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_distname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 "$_root/share/doc/$_distname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}