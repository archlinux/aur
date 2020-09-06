# Contributor: Richard Kakaš <richard.kakas@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=printrun
pkgver=2.0.0rc7
pkgrel=1
epoch=1
_projectname='Printrun'
_gittag="printrun-${pkgver}"
pkgdesc='Pronterface, Pronsole, and Printcore - Pure Python 3D printing host software and GUI'
arch=('i686' 'x86_64')
url='https://github.com/kliment/Printrun'
license=('GPL')
provides=('printrun-git')
conflicts=('printrun-git')
depends=('python-pyserial' 'python-wxpython' 'python-pyglet' 'python-numpy' 'python-appdirs')
optdepends=(
  'python-cairo: to use Projector feature'
  'python-cairosvg: to use Projector feature'
  'python-dbus: to inhibit sleep when printing'
  'python-psutil: to increase process priority when printing')
makedepends=('cython')
source=("https://github.com/kliment/${_projectname}/archive/${_gittag}.tar.gz")
sha256sums=('28df9e4427ff265dd534414d8ff08029471c58c4a94082d022e3c9336fca527b')

build() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  python setup.py build
  python setup.py build_ext --inplace
}

package() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
