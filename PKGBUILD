# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
pkgname=wewechat++
pkgver=1.2.5
pkgrel=1
epoch=
pkgdesc="美丽的第三方微信PC客户端. 利用UOS请求头修复了登陆问题."
arch=('x86_64')
url="https://gitee.com/spark-community-works-collections/wewechat-plus-plus"
license=('MIT')
groups=()
depends=('nss' 'xdg-utils' 'gconf' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst')
makedepends=()
checkdepends=()
optdepends=(
	'xdg-desktop-portal-kde: KDE 下的原生对话框'
	'xdg-desktop-portal-lxqt: lxqt 下的原生对话框'
	'xdg-desktop-portal-gnome: Gnome 下的原生对话框'
)
provides=(wewechat)
conflicts=(wewechat)
replaces=()
install=${pkgname}.install
source=(
	wewechat.svg
	wechat-${pkgver}.deb::"https://gitee.com/spark-community-works-collections/wewechat-plus-plus/releases/download/1.2.5/wewechat-1.2.5-linux-amd64.deb"
)
noextract=()
md5sums=(
    '600e74549ce2258c045d5c2f7689ea63'
    'c7b01bdc2ce755e125ebf20780680a43'
)
validpgpkeys=()
package() {
	echo '[警告] 请勿使用Pamac构建软件'
    info '解压缩源文件...'
	cd ${srcdir}
 	tar -xf data.tar.xz ./opt
	for directory in /opt /usr/share/applications /usr/share/icons/hicolor/scalable/apps; do
		info "创建目录 ${pkgdir}${directory}..."
		mkdir -p ${pkgdir}${directory}
	done
 	info '安装文件...'
    cp -r ${srcdir}/opt ${pkgdir}
    cp ${srcdir}/wewechat.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps
    echo '''[Desktop Entry]
Name=WeWechat
Comment=Unofficial WeChat client built with React, MobX and Electron.
Exec="/opt/wewechat/wewechat" %U
Terminal=false
Type=Application
Icon=wewechat
Categories=chat;Network;Utility;
''' >${pkgdir}/usr/share/applications/wewechat.desktop
}

function info() {
	all_off="$(tput sgr0)"
	bold="${all_off}$(tput bold)"
	blue="${bold}$(tput setaf 4)"
	yellow="${bold}$(tput setaf 3)"
    printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
}
