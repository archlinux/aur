# Maintainer: Kimiblock Zhou <kimiblock at icloud dot com>
# Contributor: qing <qing at he dot email>
pkgname=electronic-wechat-uos-bin
pkgver=2.3.2
pkgrel=9
_uosVer=2.1.5
epoch=
pkgdesc="Linux下更好用的微信客户端. 更多功能, 更少bug. 使用系统Electron并利用UOS请求头修复了登陆问题."
arch=('any')
url="https://github.com/Riceneeder/electronic-wechat"
license=('MIT')
groups=()
depends=('nss' 'lsb-release' 'xdg-utils' 'libxss' 'electron' 'bc' 'libnotify' 'bubblewrap')
makedepends=()
checkdepends=()
optdepends=(
	'xdg-desktop-portal-kde: KDE 原生文件选取器'
	'xdg-desktop-portal-lxqt: lxqt 原生文件选取器'
	'xdg-desktop-portal-gnome: Gnome 原生文件选取器'
	'xdg-desktop-portal: 原生文件选取器'
)
provides=(electronic-wechat)
conflicts=(electronic-wechat)
replaces=()
install=${pkgname}.install
source=(
	electronic-wechat-uos-bin
	electronic-wechat-uos-bin.desktop
	wechat.svg
	wechat-${pkgver}.deb::"https://github.com/Riceneeder/electronic-wechat/releases/download/v2.3.2-6/electronic-wechat_2.3.2_amd64.deb"
)
noextract=()
md5sums=(
	'SKIP'
	'ce7eb33de9571e8b8edca4685fc3e42d'
	'600e74549ce2258c045d5c2f7689ea63'
	'53d796e5a7c8c488998afdf5fb9020fe'
)
validpgpkeys=()
package() {
	info '解压缩源文件...'
	cd ${srcdir}
 	tar -xf data.tar.xz ./usr/lib/electronic-wechat/resources/app.asar
	for directory in /usr/bin /opt/electronic-wechat-uos-bin /usr/share/applications /usr/share/icons/hicolor/scalable/apps; do
		info "创建目录 ${pkgdir}${directory}..."
		mkdir -p ${pkgdir}${directory}
	done
	echo ""
	info "复制文件..."
	cp -r ${srcdir}/usr/lib/electronic-wechat/resources ${pkgdir}/opt/electronic-wechat-uos-bin
	cp ${srcdir}/wechat.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps
	cp ${srcdir}/electronic-wechat-uos-bin.desktop ${pkgdir}/usr/share/applications
	info '复制可执行文件...'
	cp ${srcdir}/electronic-wechat-uos-bin ${pkgdir}/usr/bin
	chmod -R 755 ${pkgdir}/*
	chmod 644 ${pkgdir}/usr/share/applications/electronic-wechat-uos-bin.desktop
	echo '''PRETTY_NAME="UnionTech OS Desktop 20 Home"
NAME="uos"
VERSION_ID="20 Home"
VERSION="20 Home"
ID=uos
HOME_URL="https://www.chinauos.com/"
BUG_REPORT_URL="http://bbs.chinauos.com"
VERSION_CODENAME=eagle''' >${pkgdir}/opt/electronic-wechat-uos-bin/os-release
	echo '''DISTRIB_ID=uos
DISTRIB_RELEASE=20
DISTRIB_DESCRIPTION="UnionTech OS 20"
DISTRIB_CODENAME=plum''' >${pkgdir}/opt/electronic-wechat-uos-bin/lsb-release
}

function info() {
	if [ -f /usr/bin/pamac ]; then
		echo "  ==> [Info]: $@"
	else
		all_off="$(tput sgr0)"
		bold="${all_off}$(tput bold)"
		blue="${bold}$(tput setaf 4)"
		yellow="${bold}$(tput setaf 3)"
		printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
    fi
}
