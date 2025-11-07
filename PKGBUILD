# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: Lunova-Studio <3424968114@qq.com>
pkgname=wonderlab-appimage-feature
_pkgname=wonderlab
pkgver=2.0.0.0825
pkgrel=1
pkgdesc="The next generation cross-platform Minecraft launcher. (dev branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/Lunova-Studio/WonderLab.Override"
license=('AGPL3')
options=(!strip)
conflicts=('wonderlab' 'wonderlab-git' 'wonderlab-appimage')
depends=('fuse' 'skia-sharp')
optdepends=('jre-openjdk: for launch Minecraft')
source_x86_64=("$_pkgname-$arch.AppImage::$url/releases/download/v$pkgver/WonderLab.linux.x64.AppImage")
source_aarch64=("$_pkgname-$arch.AppImage::$url/releases/download/v$pkgver/WonderLab.linux.arm64.AppImage")
sha256sums_x86_64=('4f87b2ccc0a1493f20f8dcc1c6cd4e321d912af2488e6ae470b3e595ef3a6cb5')
sha256sums_aarch64=('697f3a457bac48c9998619576b1634d4cdd2dc8f513c7d88497a0392bfe25ab6')
_appimage="$_pkgname-$arch.AppImage"
prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}
build() {
	chmod -R a-x+rX squashfs-root/usr
}
package() {
	install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$pkgname/$pkgname.AppImage"
	install -Dm644 "$srcdir/squashfs-root/Lunova.WonderLab.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -dm755 "$pkgdir/usr/share/"
	cp -a "$srcdir/squashfs-root/usr/share/icons" "$pkgdir/usr/share/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
