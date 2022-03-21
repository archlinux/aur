# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=uncon-bin
pkgver=2.1.2
pkgrel=2
pkgdesc="无界投屏 Linux 版，将手机屏幕和应用镜像至电脑 (带依赖)"
arch=('x86_64')
url="https://nightmare.fun/screen/"
depends=('scrcpy' 'android-tools' 'ffmpeg')
makedepends=()
optdepends=()
provides=('uncon')
source=(
"https://github.com/YidaozhanYa/uncon-binary/releases/download/2.1.2-2/Uncon.data.tar.xz"
)
sha256sums=(
"984d2238e09a1ebf41987967a489d3c5ab7df4e5c97526460958b7af2aaa5e46"
)
install='uncon-bin.install'

package() {
	cp -r "${srcdir}/opt" "${pkgdir}/opt"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/bin"
	cp "${pkgdir}/usr/share/icons/hicolor/scalable/apps/uncon.png" "${pkgdir}/usr/share/pixmaps/uncon.png"
	rm -rf "${pkgdir}/usr/share/icons"
	chmod 0755 "${pkgdir}/opt/uncon/scrcpy_client"
	sed -i "s/opt\/uncon/usr\/bin/" "${pkgdir}/usr/share/applications/uncon.desktop"
	ln -s "${pkgdir}/opt/uncon/scrcpy_client" "${pkgdir}/usr/bin/scrcpy_client"
}
