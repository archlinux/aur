# Maintainer: Otto VonStein <otto>
# Contributor: ex-maintainer Benjamin Robin <benjarobin>

pkgname=pencil2d-git
_gitname=pencil2d
pkgver=1413.2630deb
pkgrel=1
pkgdesc="Animation/drawing software, that lets you create traditional hand-drawn animation using both bitmap and vector graphics"
arch=('i686' 'x86_64')
url="http://www.pencil2d.org/"
license=('GPL')
depends=('ming' 'ffmpeg' 'qt5-svg' 'qt5-multimedia')
makedepends=('git' 'qt5-tools')
provides=('pencil2d')
conflicts=('pencil2d')
install=pencil2d.install
source=('pencil2d::git+https://github.com/pencil2d/pencil.git'
        'pencil2d.desktop')
md5sums=('SKIP'
         '98008076937080db82a939d8129ed2d0')

pkgver()
{
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
    cd "${_gitname}"
    #patch -p1 -i "${srcdir}/pencil2d.patch"
}

build()
{
    cd "${_gitname}"
    msg "Starting qmake..."
    qmake
    msg "Starting make..."
    make
}

package()
{
    cd "${_gitname}"
	install -D -m755 app/Pencil2D "${pkgdir}/usr/bin/pencil2d"
	install -D -m644 icons/icon.png "${pkgdir}/usr/share/pixmaps/pencil2d.png"
	install -D -m644 "${srcdir}/pencil2d.desktop" "${pkgdir}/usr/share/applications/pencil2d.desktop"
}

