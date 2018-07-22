# Maintainer: David A. Redick <david.a.redick@gmail.com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=vodovod
pkgver=1.10.1
pkgrel=4
pkgdesc="A free cross-platform pipe connecting game"
arch=('i686' 'x86_64')
url='https://github.com/david-redick/vodovod/'
license=('GPL')
depends=('sdl_mixer' 'sdl_image')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/david-redick/${pkgname}/archive/${pkgver}.tar.gz"
	'vodovod.desktop'
	'vodovod.xpm'
)
md5sums=(
	'1719a21b673663c22b60057d28653c6d'
	'db28845dc4a8031fc45ca05e38d462f8'
	'94fed2d1ab825bdf9811c59d305398d4'
)

build () {
        cd "${srcdir}/${pkgname}-${pkgver}"
        make
}

package () {
        mkdir -p "${pkgdir}/usr/share/applications"
        mkdir -p "${pkgdir}/usr/share/vodovod"
        mkdir -p "${pkgdir}/usr/share/pixmaps"
        mkdir -p "${pkgdir}/usr/bin"

        cd "${srcdir}/${pkgname}-${pkgver}"
        cp -R vodovod data html "${pkgdir}/usr/share/vodovod"
        echo "cd '/usr/share/vodovod/' && ./vodovod" > "${pkgdir}/usr/bin/vodovod"
        chmod 755 "${pkgdir}/usr/bin/vodovod"
        install ../vodovod.desktop "${pkgdir}/usr/share/applications"
        install ../vodovod.xpm "${pkgdir}/usr/share/pixmaps"
}
