# Maintainer: Kimiblock Moe
# Contributor: qing <qing at he dot email>
pkgname=electronic-wechat-uos-bin
pkgver=2.3.2
pkgrel=10
_uosVer=2.1.5
epoch=
pkgdesc="Linux下更好用的微信客户端. 更多功能, 更少bug. 使用系统Electron并利用UOS请求头修复了登陆问题."
arch=('any')
url="https://github.com/Riceneeder/electronic-wechat"
license=('MIT')
groups=()
depends=('nss' 'lsb-release' 'xdg-utils' 'libxss' 'electron' 'bc' 'libnotify' 'bubblewrap' 'xdg-desktop-portal')
makedepends=()
checkdepends=()
optdepends=(
	'xdg-desktop-portal-kde: KDE Portal'
	'xdg-desktop-portal-lxqt: lxqt Portal'
	'xdg-desktop-portal-gnome: Gnome Portal'
)
provides=()
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
md5sums=('39c7a6c4b56a46f690ab9ba62a00b9c4'
         'ce7eb33de9571e8b8edca4685fc3e42d'
         '600e74549ce2258c045d5c2f7689ea63'
         '53d796e5a7c8c488998afdf5fb9020fe')
validpgpkeys=()
package() {
	cd ${srcdir}
 	tar -xf data.tar.xz ./usr/lib/electronic-wechat/resources/app.asar
	install -Dm644 "${srcdir}/usr/lib/electronic-wechat/resources/app.asar" "${pkgdir}/usr/lib/electronic-wechat-uos-bin/app.asar"
	install -Dm644 "${srcdir}/wechat.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat.svg"
	install -Dm644 "${srcdir}/electronic-wechat-uos-bin.desktop" "${pkgdir}/usr/share/applications/electronic-wechat-uos-bin.desktop"
	install -Dm755 "${srcdir}/electronic-wechat-uos-bin" "${pkgdir}/usr/bin/electronic-wechat-uos-bin"
	echo '''PRETTY_NAME="UnionTech OS Desktop 20 Home"
NAME="uos"
VERSION_ID="20 Home"
VERSION="20 Home"
ID=uos
HOME_URL="https://www.chinauos.com/"
BUG_REPORT_URL="http://bbs.chinauos.com"
VERSION_CODENAME=eagle''' >"${pkgdir}/usr/lib/electronic-wechat-uos-bin/os-release"
	echo '''DISTRIB_ID=uos
DISTRIB_RELEASE=20
DISTRIB_DESCRIPTION="UnionTech OS 20"
DISTRIB_CODENAME=plum''' >"${pkgdir}/usr/lib/electronic-wechat-uos-bin/lsb-release"
}
