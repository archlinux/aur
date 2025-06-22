# Maintainer: lucas <lucaszhou007@163.com>
pkgname=voideditor
pkgver=1.4.5
_buildver=1.99.30040
pkgrel=1
pkgdesc="An open source Cursor alternative. Write code with the best AI tools, use any model, and retain full control over your data."
arch=('x86_64' 'aarch64' 'loongarch64' 'riscv64')
url="https://github.com/voideditor/void"
license=('Apache-2.0' 'MIT')
options=('!debug')
source_x86_64=( "$pkgname-$arch-$pkgver.tar.gz::https://github.com/voideditor/binaries/releases/download/$_buildver/Void-linux-x64-$_buildver.tar.gz" "VoidEditor.desktop")
source_aarch64=( "$pkgname-$arch-$pkgver.tar.gz::https://github.com/voideditor/binaries/releases/download/$_buildver/Void-linux-arm64-$_buildver.tar.gz" "VoidEditor.desktop")
source_loongarch64=( "$pkgname-$arch-$pkgver.tar.gz::https://github.com/voideditor/binaries/releases/download/$_buildver/Void-linux-loong64-$_buildver.tar.gz" "VoidEditor.desktop")
source_riscv64=( "$pkgname-$arch-$pkgver.tar.gz::https://github.com/voideditor/binaries/releases/download/$_buildver/Void-linux-riscv64-$_buildver.tar.gz" "VoidEditor.desktop")
sha256sums_x86_64=('8490fffae4a4988649e42a4fe238848249b7330481daab97f74f2d0cb696825c' 'be0c3cfc8bc7a72ed765216ad49e9964f72cc414034ad5e598a08ed93c410120')
sha256sums_aarch64=('7de67426cf683b4838129bee6a69931a7e7d2bff1577cd9f4d138febb1be30e8' 'be0c3cfc8bc7a72ed765216ad49e9964f72cc414034ad5e598a08ed93c410120')
sha256sums_loongarch64=('e4ac1f3e1ec8361bf83bd820769448fac9011565a482182c3050cc6520fc228f' 'be0c3cfc8bc7a72ed765216ad49e9964f72cc414034ad5e598a08ed93c410120')
sha256sums_riscv64=('0c88132ab4d770665bc5ce69a9c7029149b745f2a68af2712a3ab4bd4b508e0d' 'be0c3cfc8bc7a72ed765216ad49e9964f72cc414034ad5e598a08ed93c410120')
noextract=("$pkgname-$arch-$pkgver.tar.gz")

prepare(){
	mkdir -p app
	tar -xzf $pkgname-$arch-$pkgver.tar.gz  -C app
}

package() {
	# 安装到 /opt/$pkgname
	install -dm755 "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/app"  "$pkgdir/opt/$pkgname"

	# 创建可执行文件的软链接
	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/opt/$pkgname/app/bin/void" "$pkgdir/usr/bin/void"
	ln -sf "/opt/$pkgname/app/bin/void-tunnel" "$pkgdir/usr/bin/void-tunnel"

	# 安装 desktop 文件
    install -Dm644 "VoidEditor.desktop" "$pkgdir/usr/share/applications/voideditor.desktop"

	# 安装图标
    install -Dm644 "app/resources/app/resources/linux/code.png" "$pkgdir/usr/share/icons/voideditor.png"
}