# Maintainer: Solavoy <solavoy@qq.com>

pkgname=geekgeekrun-bin
pkgver=0.17.2
_pkgver="ui-v${pkgver}"
pkgrel=1
pkgdesc='牛人快跑 - GeekGeekRun，求职找工作自动化工具，基于 Puppeteer、Electron。界面友好，简单易用！开源，免费！快速海投、自动开聊、已读不回提醒、职位信息抓取、不合适职位标记、僵尸职位清理；让你即刻变身成为一台冇得感情的求职机器🤖，找工作不内耗。宝宝不用动，妈妈全自动~祝你收获好Offer！'
arch=('x86_64')
url='https://github.com/geekgeekrun/geekgeekrun'

options=('!strip')

source=("${pkgname}-${pkgver}.deb::https://github.com/geekgeekrun/geekgeekrun/releases/download/${_pkgver}/geekgeekrun-ui_${pkgver}_amd64.deb")
sha256sums=('4a63393397ff8a1594637fa79092dc28b688fe490e8087af5f9498012e3eee68')

prepare() {
	mkdir -p rootfs
	bsdtar -xf ${srcdir}/data.tar.xz -C rootfs

	# 修正错误图标目录：0x0 -> 64x64
    if [[ -d "${srcdir}/rootfs/usr/share/icons/hicolor/0x0/apps" ]]; then
        mkdir -p "${srcdir}/rootfs/usr/share/icons/hicolor/64x64"
        mv "${srcdir}/rootfs/usr/share/icons/hicolor/0x0/apps" \
           "${srcdir}/rootfs/usr/share/icons/hicolor/64x64/apps"
        rmdir --ignore-fail-on-non-empty "${srcdir}/rootfs/usr/share/icons/hicolor/0x0"
    fi
}

package() {
	cd "${srcdir}/rootfs"
	cp -a . "${pkgdir}/"
}
