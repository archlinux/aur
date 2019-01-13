# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=fusion-icon
epoch=1
pkgver=0.2.4
pkgrel=1
pkgdesc="Simple tray icon for Compiz 0.8"
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
conflicts=('fusion-icon0.9')
depends=('compizconfig-python' 'hicolor-icon-theme' 'xorg-xvinfo' 'mesa-demos')
install="$pkgname.install"
source=("https://github.com/compiz-reloaded/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")

# presume that if compizconfig-python deps are met, it's against python2
_python="python"
_sitearch_check="from distutils import sysconfig; print(sysconfig.get_python_lib(plat_specific=1))"

# do we have a python2 compizconfig-python?
if [[ -f "$(python2 -c "${_sitearch_check}")/compizconfig.so" ]]; then
	_python=python2
fi

# Note to anyone who builds this: Make sure you install the appropriate
# dependencies for the user interfaces you want to use! Otherwise, it'll appear
# like it's not working!
# Also - change these to python2 if you're using Compiz 0.9.x
optdepends=(
	"${_python}-pyqt5: For the Qt Interface"
	"${_python}-gobject: For the GTK+ Interface"
	'libappindicator-gtk3: For the GTK+ Interface'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  "${_python}" setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  "${_python}" setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('0ebc6df6a9e839a50073221bb051400b3f472b707cac094766ccee8787812297')
