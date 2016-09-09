# Maintainer  : Yiannis A Ginis <drxspace[at]gmail[dot]com>

pkgname=cronograph-conky
_prjname=cronoconky
pkgver=265.dce9026
pkgrel=1
pkgdesc="A free, conky clock widget for X which displays date, time and weather information"
arch=('any')
url="https://github.com/drxspace/cronoconky"
license=('GPL2')
provides=("${pkgname}")
depends=('curl' 'lm_sensors')
makedepends=('git' 'fontconfig')
optdepends=('hddtemp: https://wiki.archlinux.org/index.php/Hddtemp')
options=(!strip !docs !emptydirs !optipng !debug)
install='cronograph-conky.install'
source=("git+https://github.com/drxspace/${_prjname}.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_prjname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	install -dm 755 "${pkgdir}"/opt
	cp -r "${srcdir}/${_prjname}"/cronograph_blk "${pkgdir}"/opt

	install -dm 755 "${pkgdir}"/usr/share/pixmaps
	cp "${srcdir}/${_prjname}"/icons/cronograph256x256.png "${pkgdir}"/usr/share/pixmaps/cronograph.png

	install -dm 755 "${pkgdir}"/usr/share/fonts/TTF/ttf-cronograph
	cp -r "${srcdir}/${_prjname}"/ttf-cronograph "${pkgdir}"/usr/share/fonts/TTF

	install -dm 755 "${pkgdir}"/usr/local/bin
	ln -fs /opt/cronograph_blk/start_crono.sh "${pkgdir}"/usr/local/bin/start_crono
	ln -fs /opt/cronograph_blk/restart_crono.sh "${pkgdir}"/usr/local/bin/restart_crono
	ln -fs /opt/cronograph_blk/stop_crono.sh "${pkgdir}"/usr/local/bin/stop_crono

	install -dm 755 "${pkgdir}"/etc/xdg/autostart
	cp "${srcdir}/${_prjname}"/cronograph_conky.desktop "${pkgdir}"/etc/xdg/autostart

	cd "${srcdir}/${_prjname}"
	install -D -m644 LICENSE.GPL ${pkgdir}/usr/share/licenses/${_prjname}/LICENSE.GPL
}
