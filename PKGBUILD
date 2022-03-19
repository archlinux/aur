# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=uncon-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="无界投屏 Linux 版，将手机屏幕和应用镜像至电脑"
arch=('x86_64')
url="https://nightmare.fun/screen/"
depends=('android-tools' 'scrcpy' 'ffmpeg' 'sdl2' 'libusb' 'libc++')
makedepends=()
optdepends=()
provides=('uncon')
source=(
"https://github.com/YidaozhanYa/uncon-binary/releases/download/v1.0/Uncon.deb"
"uncon.desktop"
"uncon.png"
"scrcpy.sh"
)
sha256sums=(
"206043aebf6e3f53cb84f9284975e704eadbb629e75dc5aacbb3e2663a205730"
"c2076d7e65995abff87e8e579b37f058a33cd1aa394d9b2d082e358c8e3ba9bf"
"b3c7c5a7fef65d365c19110e008ae4ce863fff21d9cbf0ed5e34af5a5453ac30"
"537278b084e7bce25ac6c0c954b729d8861b3234568798d3ad519cd3d2bc058e"
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

	#scrcpy
	rm "${pkgdir}/opt/uncon/data/usr/bin/scrcpy"
	rm "${pkgdir}/opt/uncon/data/usr/bin/scrcpy_binary"
	rm "${pkgdir}/opt/uncon/data/usr/bin/scrcpy-server-1.23"
	install -Dm0777 "${srcdir}/scrcpy.sh" "${pkgdir}/opt/uncon/data/usr/bin/scrcpy"
	ln -s "/usr/bin/scrcpy" "${pkgdir}/opt/uncon/data/usr/bin/scrcpy_binary"
	ln -s "/usr/share/scrcpy/scrcpy-server" "${pkgdir}/opt/uncon/data/usr/bin/scrcpy-server-1.23"

	#adb
	rm "${pkgdir}/opt/uncon/data/usr/bin/adb"
	ln -s "/usr/bin/adb" "${pkgdir}/opt/uncon/data/usr/bin/adb"

	#ffmpeg
	rm "${pkgdir}/opt/uncon/data/usr/bin/libavcodec.so.59"
	rm "${pkgdir}/opt/uncon/data/usr/bin/libavcodec.so.59.18.100"
	ln -s "/usr/lib/libavcodec.so" "${pkgdir}/opt/uncon/data/usr/bin/libavcodec.so.59"
	rm "${pkgdir}/opt/uncon/data/usr/bin/libavdevice.so.59"
	rm "${pkgdir}/opt/uncon/data/usr/bin/libavdevice.so.59.4.100"
	ln -s "/usr/lib/libavdevice.so" "${pkgdir}/opt/uncon/data/usr/bin/libavdevice.so.59"
	rm "${pkgdir}/opt/uncon/data/usr/bin/libavformat.so.59"
	rm "${pkgdir}/opt/uncon/data/usr/bin/libavformat.so.59.16.100"
	ln -s "/usr/lib/libavformat.so" "${pkgdir}/opt/uncon/data/usr/bin/libavformat.so.59"
	rm "${pkgdir}/opt/uncon/data/usr/bin/libavutil.so.57"
	rm "${pkgdir}/opt/uncon/data/usr/bin/libavutil.so.57.17.100"
	ln -s "/usr/lib/libavutil.so" "${pkgdir}/opt/uncon/data/usr/bin/libavutil.so.57"

	#others
	rm "${pkgdir}/opt/uncon/data/usr/bin/libSDL2-2.0.so.0"
	ln -s "/usr/lib/libSDL2-2.0.so" "${pkgdir}/opt/uncon/data/usr/bin/libSDL2-2.0.so.0"
	rm "${pkgdir}/opt/uncon/data/usr/bin/libusb-1.0.so.0"
	ln -s "/usr/lib/libusb-1.0.so" "${pkgdir}/opt/uncon/data/usr/bin/libusb-1.0.so.0"
	rm "${pkgdir}/opt/uncon/data/usr/bin/lib64/libc++.so"
	ln -s "/usr/lib/libc++.so" "${pkgdir}/opt/uncon/data/usr/bin/lib64/libc++.so"


	mkdir -p "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/opt/uncon/scrcpy_client" "${pkgdir}/usr/bin/scrcpy_client"
	install -Dm0755 "${srcdir}/uncon.desktop" "${pkgdir}/usr/share/applications/uncon.desktop"
	install -D "${srcdir}/uncon.png" "${pkgdir}/usr/share/pixmaps/uncon.png"
}
