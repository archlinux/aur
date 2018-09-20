# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>

pkgname=yaup-git
pkgver=0.1.r2.gdabd262
pkgrel=2
pkgdesc="Yet Another UPnP Portmapper - A GTK frontend for miniupnpc"
arch=('i686' 'x86_64')
url="https://github.com/Holarse-Linuxgaming/yaup"
license=('GPL3')
depends=('miniupnpc' 'gtk3' 'hicolor-icon-theme')
makedepends=('git' 'gendesk' 'intltool' 'libtool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Holarse-Linuxgaming/yaup.git"
		"${pkgname%-git}.desktop")
sha512sums=('SKIP'
            'd116842d5c1d0fa1843d82ef8ecb7706fa8f12ae23ffd588b7bb0ac77e02b34aae6f362e9b8b74620902edd47b6e6d86ddf258bcdf1cd2143bdaa018b832df9e')

pkgver()
{
	cd "${srcdir}/${pkgname%-git}" || exit
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd "${srcdir}/${pkgname%-git}" || exit
	./autogen.sh --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname%-git}" || exit
	make DESTDIR="${pkgdir}" install

	install -Dm644	"${srcdir}/${pkgname%-git}.desktop" \
					"${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"

	install -Dm644	"${srcdir}/${pkgname%-git}/src/${pkgname%-git}-dark.png" \
					"${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
}
