# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=libinput-gestures
pkgver=r543.53bd344
_commit=db6b6882d2d16022eba58a1a68cd701ccdd2047f
pkgrel=1
pkgdesc="Actions gestures on your touchpad using libinput"
arch=('any')
license=('GPL3')
url="https://github.com/bulletmark/libinput-gestures"
depends=('libinput' 'xdotool' 'python')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/bulletmark/libinput-gestures/archive/${_commit}.tar.gz")
md5sums=('bd02814350a1aae4e65e9168dbcf658b')

#pkgver() {
#	cd "${srcdir}/${pkgname}-${_commit}"
#	( set -o pipefail
#	git describe --long 2>/dev/null | sed 's/^slurm-//;s/\([^-]*-g\)/r\1/;s/-/./g' \
#	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#	)
#}

prepare() {
	cd "${srcdir}/${pkgname}-${_commit}"

	# Quick and dirty fix to make /etc/conf.d/libinput-gestures.conf the main/only configuration file
	sed -i 's/~\/.config/\/etc\/conf.d/g' libinput-gestures
}

package() {
	cd "${srcdir}/${pkgname}-${_commit}"

	install -D -m755 "${pkgname}"         "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${pkgname}.conf"    "${pkgdir}/etc/conf.d/${pkgname}.conf"
	install -D -m644 "${pkgname}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
}
