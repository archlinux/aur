# Maintainer  : Yiannis A Ginis <drxspace[at]gmail[dot]com>
# Contributor : All of you ;)

pkgname=cronograph-conky
pkgver=8.1.170213
pkgrel=1
pkgdesc="A free, conky clock widget for X which displays date, time and weather information"
arch=('any')
url="https://github.com/drxspace/cronoconky"
license=('GPL2')
provides=("${pkgname}")
depends=('conky-lua-archers-git' 'curl' 'lm_sensors')
makedepends=('git' 'fontconfig')
optdepends=('hddtemp: https://wiki.archlinux.org/index.php/Hddtemp')
source=("https://github.com/drxspace/cronoconky/releases/download/${pkgver}/v${pkgver}.tar.gz")
sha1sums=('6e129b069fd3a5119770638eeb5e99bd286708d7')
install='cronograph-conky.install'
options=(!strip !docs !emptydirs !optipng !debug)

package() {
	install -dm 755 "${pkgdir}"/opt
	cp -r "${srcdir}"/cronograph_blk "${pkgdir}"/opt

	install -dm 755 "${pkgdir}"/usr/share/pixmaps
	cp "${srcdir}"/icons/cronograph256x256.png "${pkgdir}"/usr/share/pixmaps/cronograph.png

	install -dm 755 "${pkgdir}"/usr/share/fonts/TTF/ttf-cronograph
	cp -r "${srcdir}"/ttf-cronograph "${pkgdir}"/usr/share/fonts/TTF

	install -dm 755 "${pkgdir}"/usr/local/bin
	ln -fs /opt/cronograph_blk/start_crono.sh "${pkgdir}"/usr/local/bin/start_crono
	ln -fs /opt/cronograph_blk/restart_crono.sh "${pkgdir}"/usr/local/bin/restart_crono
	ln -fs /opt/cronograph_blk/stop_crono.sh "${pkgdir}"/usr/local/bin/stop_crono

	cd "${srcdir}"

	install -D -m755 cronograph_conky.desktop "$pkgdir/usr/share/applications/cronograph_conky.desktop"
	install -D -m755 cronograph_conky.desktop "$pkgdir/etc/xdg/autostart/cronograph_conky.desktop"

	install -D -m644 LICENSE.GPL ${pkgdir}/usr/share/licenses/LICENSE.GPL
}
