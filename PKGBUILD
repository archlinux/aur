# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=feeluown-mpris2-plugin
pkgname="${_pkgname}-git"
pkgver=r7.ecac35e
pkgrel=1
pkgdesc="mpris dbus interface implementation for feeluown"
arch=("any")
url="https://github.com/cosven/feeluown-mpris2-plugin"
license=('MIT')
depends=('feeluown>=9.1a' 'python-pyqt5' 'qt5-multimedia' 'python-dbus')
optdepends=('osd-lyrics-git: OSD lyric show')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"

    _pyver=$(python3 -c "import sys; sys.stdout.write('%d.%d' % sys.version_info[0:2])")
    find ./{*\.py,*\.xml} -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/lib/python${_pyver}/site-packages/feeluown/plugins/${_pkgname}/{}" \;

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

