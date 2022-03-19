# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=uncon-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="无界投屏 Linux 版，将手机屏幕和应用镜像至电脑"
arch=('x86_64')
url="https://nightmare.fun/screen/"
depends=('android-tools' 'scrcpy')
makedepends=()
optdepends=()
provides=('uncon')
source=(
"https://github.com/YidaozhanYa/uncon-binary/releases/download/v1.0/Uncon.deb"
"uncon.desktop"
"uncon.png")
sha256sums=(
"206043aebf6e3f53cb84f9284975e704eadbb629e75dc5aacbb3e2663a205730"
"c2076d7e65995abff87e8e579b37f058a33cd1aa394d9b2d082e358c8e3ba9bf"
"b3c7c5a7fef65d365c19110e008ae4ce863fff21d9cbf0ed5e34af5a5453ac30"
)
install="uncon.install"

prepare() {
	cd "${srcdir}"
	tar -xvf data.tar.xz
}

package() {
	install -Dm0755 "${srcdir}/usr/lib/scrcpy_client" "${pkgdir}/opt/uncon/scrcpy_client"
	cp -r "${srcdir}/usr/lib/lib" "${pkgdir}/opt/uncon/lib"
	cp -r "${srcdir}/usr/lib/data" "${pkgdir}/opt/uncon/data"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/opt/uncon/scrcpy_client" "${pkgdir}/usr/bin/scrcpy_client"
	install -Dm0755 "${srcdir}/uncon.desktop" "${pkgdir}/usr/share/applications/uncon.desktop"
	install -D "${srcdir}/uncon.png" "${pkgdir}/usr/share/pixmaps/uncon.png"
}
