# Contributor: Richard Kakaš <richard.kakas@gmail.com>
# Contributor: Eric Anderson <ejona86@gmail.com>
# Maintainer: Dan Panzarella <alsoelp@gmail.com>

pkgname=printrun-git
_gitname='Printrun'
pkgver=20150310
pkgrel=1
pkgdesc='Pronterface, Pronsole, and Printcore - Pure Python 3D printing host software and GUI'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/kliment/Printrun'
license=('GPL')
provides=('printrun')
conflicts=('printrun')
depends=('python2-pyserial' 'wxpython' 'pyglet' 'desktop-file-utils')
optdepends=(
  'python2-cairo: to use Projector feature'
  'python2-cairosvg: to use Projector feature'
  'python2-numpy: for 3D view'
  'python2-dbus: to inhibit sleep when printing'
  'python2-psutil: to increase process priority when printing')
makedepends=('git' 'cython2')
install="${pkgname}.install"
source=('git://github.com/kliment/Printrun.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --always | sed 's/printrun-//' | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
