# Maintainer: lucas <lucaszhou007@163.com>
pkgname=voideditor
pkgver=1.4.9
_buildver=1.99.30044
pkgrel=1
pkgdesc="An open source Cursor alternative. Write code with the best AI tools, use any model, and retain full control over your data."
arch=('x86_64' 'aarch64' 'loongarch64' 'riscv64')
url="https://github.com/voideditor/void"
license=('Apache-2.0' 'MIT')
options=('!debug')
source_x86_64=( "$pkgname-$arch.tar.gz::https://github.com/voideditor/binaries/releases/download/$_buildver/Void-linux-x64-$_buildver.tar.gz" "VoidEditor.desktop")
source_aarch64=( "$pkgname-$arch.tar.gz::https://github.com/voideditor/binaries/releases/download/$_buildver/Void-linux-arm64-$_buildver.tar.gz" "VoidEditor.desktop")
source_loongarch64=( "$pkgname-$arch.tar.gz::https://github.com/voideditor/binaries/releases/download/$_buildver/Void-linux-loong64-$_buildver.tar.gz" "VoidEditor.desktop")
source_riscv64=( "$pkgname-$arch.tar.gz::https://github.com/voideditor/binaries/releases/download/$_buildver/Void-linux-riscv64-$_buildver.tar.gz" "VoidEditor.desktop")
sha256sums_x86_64=('7beb974b52716be77397e420e0c103625ed7145365393ecef7aa160766c06a04' 'be0c3cfc8bc7a72ed765216ad49e9964f72cc414034ad5e598a08ed93c410120')
sha256sums_aarch64=('ae9d2c0fe6813f51e7359531b777143159841dbb2df3ccd89831eac70937b3b4' 'be0c3cfc8bc7a72ed765216ad49e9964f72cc414034ad5e598a08ed93c410120')
sha256sums_loongarch64=('85b39967e712e4b50ae08c84e9ca24e6776f00d4265ee7af681cc24160e45df2' 'be0c3cfc8bc7a72ed765216ad49e9964f72cc414034ad5e598a08ed93c410120')
sha256sums_riscv64=('401fb89b7fa7243c89c3b78bfe4e207abb0fcb65e1e59b97faa24f95884f6fad' 'be0c3cfc8bc7a72ed765216ad49e9964f72cc414034ad5e598a08ed93c410120')
noextract=("$pkgname-$arch.tar.gz")

prepare(){
	mkdir -p app
	tar -xzf $pkgname-$arch.tar.gz  -C app
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