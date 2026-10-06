# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=jcchess
pkgver=0.0.1
pkgrel=2
pkgdesc="A chess GUI to play against chess engines "
arch=('any')
url="https://johncheetham.com/projects/${pkgname}/index.html"
license=('GPL-3.0-only')
depends=('python3' 'python-cairo' 'gtk3' 'gdk-pixbuf2' 'python-gobject')
makedepends=('git' 'python-setuptools')
optdepends=('gnuchess: chess engine to play against'
            'stockfish: chess engine to play against'
            'fruit: chess engine to play against')
source=("git+https://github.com/johncheetham/${pkgname}.git")
sha256sums=('SKIP')

prepare() {
    # removing the deprecated ez_setup - ensure that build depends on local python-setuptools:

    # 1) remove ez_setup.py entirely:
    rm "${srcdir}/${pkgname}/ez_setup.py"

    # 2) remove the two lines from the main setup script that reference the ez_setup.py:
    sed -i '1,2d' "${srcdir}/${pkgname}/setup.py"
}

package() {
   cd "${srcdir}/${pkgname}"
   python setup.py install --root "${pkgdir}"
}
