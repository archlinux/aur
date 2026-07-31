# Maintainer: George Hu <integral@archlinux.org>

pkgname=servo-bin
_pkgname="${pkgname%-bin}"
pkgver=0.4.0
pkgrel=1
pkgdesc="A prototype web browser engine written in the Rust language"
arch=('x86_64')
url="https://${_pkgname}.org"
license=('MPL-2.0')
depends=(
	'fontconfig'
	'glib2'
	'glibc'
	'gst-plugins-bad-libs'
	'gst-plugins-base-libs'
	'gstreamer'
	'hicolor-icon-theme'
	'libgcc'
	'libstdc++'
	'systemd-libs'
	'zlib'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}/${_pkgname}-x86_64-linux-gnu.tar.gz")
sha256sums=('419f6579a22704a6b4a5f48348401d43a0ed8098103bca560c22ac009e3a0b2f')

prepare() {
	sed -i '/^Exec=/s|SERVO_SRC_PATH/target/release/||;/TODO:/d' "${_pkgname}/resources/org.servo.Servo.desktop"
}

package() {
	cd "${_pkgname}/"
	install -Dm755 servoshell -t "${pkgdir}/usr/lib/${_pkgname}/"
	install -d "${pkgdir}/usr/bin/"
	ln -s "/usr/lib/${_pkgname}/servoshell" "${pkgdir}/usr/bin/servoshell"

	cp -a resources "${pkgdir}/usr/lib/${_pkgname}/"
	cd resources
	install -Dm644 "org.servo.Servo.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 "${_pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "${_pkgname}_64.png" -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
	install -Dm644 "${_pkgname}_1024.png" -t "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/"
}
