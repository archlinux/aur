# Maintainer: Tuneful <tuneful "dot" su "at" yandex "dot" com>

pkgname=yunhu
pkgver=1.6.13+188
pkgrel="1"
pkgdesc="yunhu-1.6.13+188 for Linux (Commercial software, please refer to the license terms.)"
arch=('x86_64')
url="https://www.yhchat.com/"
license=('proprietary')
depends=(
	libayatana-appindicator
	mpv
	jq
)
source=("https://app-cdn1.jwznb.com/linux/yunhu-1.6.13+188-linux.tar.gz")
sha256sums=('881bf287e0f8ccc40e8c5ca967d4c433706a3032fc834e66fc350750ec0348a7')

package() {
	export LD_PRELOAD=/usr/lib/libfakeroot/libfakeroot.so
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/"
	tar -xzvf "yunhu-1.6.13+188-linux.tar.gz" -C "$pkgdir/opt/"
	mv "$pkgdir/opt/yunhu-1.6.13+188-linux/yunhu" "$pkgdir/opt/"
	install -Dm644 "$srcdir/yunhu-1.6.13+188-linux/applications/yunhu.desktop" "$pkgdir/usr/share/applications/yunhu.desktop"
	for size in 16x16 32x32 48x48 64x64 128x128 256x256
	do
		install -Dm644 "$srcdir/yunhu-1.6.13+188-linux/icons/hicolor/$size/apps/yunhu.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/yunhu.png"
	done


	# 确保目标路径存在
	install -d "$pkgdir/usr/lib"
	install -d "$pkgdir/usr/bin"

	# 检查系统中是否存在 /usr/lib/libmpv.so.1
	if [ ! -e /usr/lib/libmpv.so.1 ]; then
		# 创建符号链接
		ln -s /usr/lib/libmpv.so.2 "$pkgdir/usr/lib/libmpv.so.1"
	fi

	ln -s /opt/yunhu/yunhu "$pkgdir/usr/bin"

	# 删除不需要的目录
	rm -rf "$pkgdir/opt/yunhu-1.6.13+188-linux/"
}

