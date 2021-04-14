# Maintainer: artemtech <sofyanartem@gmail.com>

pkgname=citramanik-qt-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Your next way to export your Inkscape work for all purpose quickly"
arch=("x86_64")
url="https://citramanik.dev-is.my.id"
license=("GPLv3")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('inkscape' 'ghostscript')
makedepends=('bzip2')
source=("https://getcitramanik.dev-is.my.id/releases/${pkgver}/linux/citramanik-qt-${pkgver}-0-${arch}-bullseye.deb")

options=("!strip")
md5sums=("SKIP")

build() {
	mkdir -p "${srcdir}/output"
	tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/{applications,icons}
	install -Dm755 "${srcdir}"/output/usr/local/bin/citramanik-qt "${pkgdir}"/usr/bin/citramanik-qt
	install -Dm644 "${srcdir}"/output/usr/share/applications/citramanik-qt.desktop "${pkgdir}"/usr/share/applications/citramanik-qt.desktop
	cp -r "${srcdir}"/output/usr/share/icons "${pkgdir}"/usr/share/icons
	sed -i "s#usr/local/bin#usr/bin#" "${pkgdir}"/usr/share/applications/citramanik-qt.desktop
}

