# Maintainer: 小阚LittleKan <littlekan233@qq.com>
# Upstream: https://github.com/ClassIsland/ClassIsland

pkgname="classisland"
pkgver="1.7.103.0"
pkgrel=1
pkgdesc="ClassIsland - 适用于班级大屏的课表小工具。社区维护 AUR 包。"
arch=('x86_64' 'aarch64')
url='https://www.classisland.tech/'
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-bin' 'dotnet-host-bin')

source=("LICENSE.txt" "launcher.sh")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' '5edb8220e6b29f71e2ebe7611115343d50dfff62107858a1d6fa823743709933')
# x86_64文件信息
source_x86_64=("https://ghfast.top/https://github.com/ClassIsland/ClassIsland/releases/download/${pkgver}/ClassIsland_app_linux_x64_selfContained_deb.deb")
sha256sums_x86_64=("52f036c3e040a1ca956053cccb49efd3e9d271eba63d66b986a90c1d9ca352cc")

# aarch64文件信息
source_aarch64=("https://ghfast.top/https://github.com/ClassIsland/ClassIsland/releases/download/${pkgver}/ClassIsland_app_linux_arm64_selfContained_deb.deb")
sha256sums_aarch64=("cfc9ae088ebf58a74f7d92d5d499f58f2463a5dee07b69d1e99378619bad2dda")

package() {
	echo " <-> 欢迎使用 ClassIsland！"
	echo " <-> 请坐和放宽，一切交给我们来处理。"
	echo " <-> 正在解压 data.tar.xz，使用 bsdtar..."
	bsdtar -xf data.tar.xz -C "${pkgdir}/"
	echo " <-> 正在安装..."
	echo " <-> [1/3] 创建启动器 /usr/bin/classisland..."
	# Launcher 创建
	install -Dm755 "launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
	echo " <-> [2/3] 修改 Desktop Entry..."
	# 更改 Desktop Entry 内容
	sed -i 's|^Exec=/opt/apps/cn\.classisland\.app/files/bin/ClassIsland\.Desktop.*|Exec=classisland|' "${pkgdir}/usr/share/applications/cn.classisland.app.desktop"
	echo " <-> [3/3] 移动 LICENSE"
	# License 复制
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	echo " <-> 安装完成！快去品尝美味可口的 ClassIsland 吧！awa"
}
