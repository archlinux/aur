# Contributor: Richard Kakaš <richard.kakas@gmail.com>
# Contributor: Dan Panzarella <alsoelp@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=printrun-git
_gitname='Printrun'
pkgver=2.0.0rc8.3.ga6e58b2
pkgrel=1
epoch=1
pkgdesc='Pronterface, Pronsole, and Printcore - Pure Python 3D printing host software and GUI'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/kliment/Printrun'
license=('GPL')
provides=('printrun')
conflicts=('printrun')
depends=('python-pyserial' 'python-wxpython' 'python-pyglet' 'python-numpy' 'python-appdirs')
optdepends=(
  'python-cairo: to use Projector feature'
  'python-cairosvg: to use Projector feature'
  'python-dbus: to inhibit sleep when printing'
  'python-psutil: to increase process priority when printing')
makedepends=('git' 'cython' 'python-setuptools')
source=('git://github.com/kliment/Printrun.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --always | sed 's/printrun-//' | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
  python setup.py build_ext --inplace
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
