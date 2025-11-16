# Maintainer: George Hu <integral@archlinux.org>

pkgname=servo-bin
_pkgname="${pkgname%-bin}"
pkgver=0.0.2
pkgrel=1
pkgdesc="A prototype web browser engine written in the Rust language"
arch=('x86_64')
url="https://${_pkgname}.org"
license=('MPL-2.0')
depends=(
	'fontconfig'
	'gcc-libs'
	'glib2'
	'glibc'
	'gst-plugins-bad-libs'
	'gst-plugins-base-libs'
	'gstreamer'
	'hicolor-icon-theme'
	'systemd-libs'
	'zlib'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-linux-gnu.tar.gz")
sha256sums=('f10a9c5e71f16511a4722c254aa2c7a5d1b920a4c20583d22a8b68070512e2c0')

prepare() {
	sed -i '/^Exec=/s|SERVO_SRC_PATH/target/release/||;/TODO:/d' "${_pkgname}/resources/org.servo.Servo.desktop"
}

package() {
	cd "${_pkgname}/"
	install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/lib/${_pkgname}/"
	install -d "${pkgdir}/usr/bin/"
	ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	cp -a resources "${pkgdir}/usr/lib/${_pkgname}/"
	cd resources
	install -Dm644 "org.servo.Servo.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 "${_pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "${_pkgname}_64.png" -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
	install -Dm644 "${_pkgname}_1024.png" -t "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/"
}
