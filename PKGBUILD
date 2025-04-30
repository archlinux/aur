# Maintainer: Ansel Hayashi <Telegram: @sym_ansel>
pkgname=kemulatornnmod-bin
pkgver=2.19.2
pkgrel=9
epoch=0
pkgdesc="Emulator for j2me, CLDC, MIDP applications and games"
arch=('x86_64')
url="https://nnproject.cc/kem/"
license=('custom')
depends=('java-runtime-openjdk'
	'xdg-utils'
	'bash'
	'gtk3'
	'vlc')
source=(pkg_${pkgver}.zip::"https://nnm.nnchan.ru/dl/kemnnx64_1.zip"
    "icon.png"
	"starter.sh")
sha256sums=('b2e43b3fc1c644e5b6e13e64f4dc04fe53f95ec627119b2295ff748f25c653e6'
	'b6215676e6550a4472bbabe238ad55daaa52a7efe0f7475de58a109755f470ab'
	'8d475d2720111f510a77ff331fd8ef336fc5a0e8d7fe0ebf2ecd0e7017569462')

prepare() {
	chmod +x "${srcdir}/starter.sh"
	cd ${srcdir}/kemnnx64
	rm *windows*
	rm *win32*
	rm *macos*
	rm *.dll
	rm *-osx*
	rm *.bat
	rm *.sh
	rm *arm32*
	rm *arm64*
	rm *aarch64*
	rm *armhf*
	rm *-x86.jar
}

package() {
	# wheels
	install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/cc.nnproject.kemulator.png"
	install -Dm644 "${srcdir}/kemnnx64/.package/cc.nnproject.kemulator.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm755 "${srcdir}/starter.sh" "${pkgdir}/usr/bin/kemulator"
	install -Dm644 "${srcdir}/kemnnx64/.package/cc.nnproject.kemulator.xml" -t "${pkgdir}/usr/share/metainfo/"

	# kemnn itself
	install -Dm644 "${srcdir}/kemnnx64/"*.jar -t "${pkgdir}/usr/share/kemulator/"
	install -Dm644 "${srcdir}/kemnnx64/libjinput-linux64.so" "${pkgdir}/usr/share/kemulator/libjinput-linux64.so"
	install -Dm644 "${srcdir}/kemnnx64/lang/"* -t "${pkgdir}/usr/share/kemulator/lang/"

	# uei
	install -Dm644 "${srcdir}/kemnnx64/uei/"* -t "${pkgdir}/usr/share/kemulator/uei/"
	chmod 755 "${pkgdir}/usr/share/kemulator/uei/preverify"
	chmod 755 "${pkgdir}/usr/share/kemulator/uei/preverify1.0"
	chmod 755 "${pkgdir}/usr/share/kemulator/uei/preverify1.1"
	chmod 755 "${pkgdir}/usr/share/kemulator/uei/emulator"
}
