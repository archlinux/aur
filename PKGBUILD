# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
# Contributor: qing <qing at he dot email>
pkgname=electronic-wechat-uos-bin
pkgver=2.3.2
pkgrel=2
epoch=
pkgdesc="Linux下更好用的微信客户端. 由 Onedrive 提供国内下载加速"
arch=('x86_64')
url="https://github.com/Riceneeder/electronic-wechat"
license=('MIT')
groups=()
depends=('nss' 'xdg-utils' 'libxss' 'electron')
makedepends=()
checkdepends=()
optdepends=(
	'xdg-desktop-portal-kde: KDE 下的原生对话框'
	'xdg-desktop-portal-lxqt: lxqt 下的原生对话框'
	'xdg-desktop-portal-gnome: Gnome 下的原生对话框'
	'libnotify: 桌面通知, 需要搭配通知服务器使用'
)
provides=(electronic-wechat)
conflicts=()
replaces=()
install=${pkgname}.install
source=(
	electronic-wechat-uos-bin.desktop
	wechat.svg
	wechat-${pkgver}.deb::"https://kimiblock.top:25212/api/v3/file/source/2421/wechat-2.3.2.deb?sign=4DDoKiaeYDwNHfWBKF6RuLfZvUSr_smAza49Nfi7mhc%3D%3A0"
)
noextract=()
md5sums=(
	'56e85109b5bcf72ef8439aec054b204d'
	'600e74549ce2258c045d5c2f7689ea63'
	'53d796e5a7c8c488998afdf5fb9020fe'
)
validpgpkeys=()
package() {
	echo '[警告] 请勿使用Pamac构建软件'
	info '解压缩源文件...'
	cd ${srcdir}
 	tar -xf data.tar.xz ./usr/lib/electronic-wechat/resources/app.asar
	for directory in /usr/bin /opt/electronic-wechat-uos-bin /usr/share/applications /usr/share/icons/hicolor/scalable/apps; do
		info "创建目录 ${pkgdir}${directory}..."
		mkdir -p ${pkgdir}${directory}
	done
	info "复制文件..."
	cp -r ${srcdir}/usr/lib/electronic-wechat/resources ${pkgdir}/opt/electronic-wechat-uos-bin
	cp ${srcdir}/wechat.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps
	cp ${srcdir}/electronic-wechat-uos-bin.desktop ${pkgdir}/usr/share/applications
	info '创建可执行文件...'
	echo '#!/bin/bash
exec electron /opt/electronic-wechat-uos-bin/resources/app.asar' >${pkgdir}/usr/bin/electronic-wechat-uos-bin
	chmod -R 755 ${pkgdir}/*
	chmod 644 ${pkgdir}/usr/share/applications/electronic-wechat-uos-bin.desktop
}

function info() {
	all_off="$(tput sgr0)"
	bold="${all_off}$(tput bold)"
	blue="${bold}$(tput setaf 4)"
	yellow="${bold}$(tput setaf 3)"
    printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
}
