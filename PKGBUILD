# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=misterdownloadmanager-bin
_pkgname=misterdownloadmanager
_upstream_url=https://github.com/anefzaoui/misterdownloadmanager
_distname=MisterDownloadManager
pkgver=0.5.0
pkgrel=1
pkgdesc="The ultimate open-source download manager (prebuilt binary)"
arch=('x86_64')
url="https://github.com/anefzaoui/$_pkgname"
license=('GPL-3.0-only')
depends=('dbus' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11'
         'libxrender' 'wayland')
optdepends=('flatpak: install browser extensions'
            'vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$_distname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('fc0f3948ee223b7d3706c4a8dc74180b9d5042d8c0b7dab5637a6c8892011171')

package() {
	local _root="$srcdir/$_distname-$pkgver-linux-x86_64"
	install -Dm755 "$_root/misterdownloadmanager" "$pkgdir/usr/bin/misterdownloadmanager"
	install -Dm755 "$_root/misterdownloadmanager-cli" "$pkgdir/usr/bin/misterdownloadmanager-cli"
	install -Dm755 "$_root/misterdownloadmanager-mcp" "$pkgdir/usr/bin/misterdownloadmanager-mcp"
	install -Dm755 "$_root/misterdownloadmanager-nmhost" "$pkgdir/usr/bin/misterdownloadmanager-nmhost"
	install -d "$pkgdir/usr/share/misterdownloadmanager"
	install -Dm644 "$_root/ATTRIBUTION.md" "$pkgdir/usr/share/doc/$pkgname/ATTRIBUTION.md"
	install -Dm644 "$_root/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Browser extensions
	install -d "$pkgdir/usr/share/misterdownloadmanager/extension-chromium"
	cp -a "$_root/extension-chromium/." "$pkgdir/usr/share/misterdownloadmanager/extension-chromium/"
	install -Dm644 "$_root/mdm-firefox.xpi" "$pkgdir/usr/share/misterdownloadmanager/mdm-firefox.xpi"
}
