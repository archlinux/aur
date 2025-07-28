# Maintainer: 小阚LittleKan <littlekan233@qq.com>
# Upstream: https://github.com/ClassIsland/ClassIsland

pkgname="classisland"
pkgver="1.7.104.0"
pkgrel=1
pkgdesc="ClassIsland - 适用于班级大屏的课表小工具。社区维护 AUR 包。"
arch=('x86_64' 'aarch64')
url='https://www.classisland.tech/'
license=('GPL-3.0-only')
options=('!strip' '!debug')
conflicts=('classisland-git')

source=("LICENSE.txt" "launcher.sh")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' '751127b78f0b1d9d07ebbcd87ea8e27d1f96467861a4b7491b77132158587987')
# x86_64文件信息
source_x86_64=("https://ghfast.top/https://github.com/ClassIsland/ClassIsland/releases/download/${pkgver}/ClassIsland_app_linux_x64_selfContained_deb.deb")
sha256sums_x86_64=("b3106d408ec55c03ca62ab86e1f9120328bfe7509427483538933c75bf69b78a")

# aarch64文件信息
source_aarch64=("https://ghfast.top/https://github.com/ClassIsland/ClassIsland/releases/download/${pkgver}/ClassIsland_app_linux_arm64_selfContained_deb.deb")
sha256sums_aarch64=("a2e45e9eeb6ff6e3c849814e983aad7a38c75d6980a2f0763e75ffd02c0b6327")

package() {
	echo " <-> 欢迎使用 ClassIsland！"
	echo " <-> 请坐和放宽，一切交给我们来处理。"
	echo " <-> 正在解压 data.tar.xz，使用 bsdtar..."
	bsdtar -xf data.tar.xz -C "${pkgdir}/"
	mv "${pkgdir}/opt/apps/cn.classisland.app/files/bin/" "${pkgdir}/opt/classisland/"
	rm -rf "${pkgdir}/opt/apps"
	echo " <-> 正在安装..."
	echo " <-> [1/3] 创建启动器 /usr/bin/classisland..."
	# Launcher 创建
	install -Dm755 "launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
	echo " <-> [2/3] 修改 Desktop Entry..."
	# 更改 Desktop Entry 内容
	sed -i 's|^Exec=/opt/apps/cn\.classisland\.app/files/bin/ClassIsland\.Desktop.*|Exec=classisland|' "${pkgdir}/usr/share/applications/cn.classisland.app.desktop"
	echo " <-> [3/3] 复制 LICENSE"
	# License 复制
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	echo " <-> 安装完成！快去品尝美味可口的 ClassIsland 吧！awa"
}
