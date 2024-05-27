# Contributor: Richard Kakaš <richard.kakas@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=printrun
pkgver=2.1.0
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
depends=('python-pyserial' 'python-wxpython' 'python-pyglet' 'python-numpy' 'python-platformdirs')
optdepends=(
  'python-cairo: to use Projector feature'
  'python-dbus: to inhibit sleep when printing'
  'python-psutil: to increase process priority when printing')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/kliment/${_projectname}/archive/${_gittag}.tar.gz"
        "python312.diff")
sha256sums=('cc9c9fcf95b1eef1fb77e5fcb22b0bc2fb82a240ce075c39a82283a84855e381'
            'c99237af701a3743d887db17fd5cacdf6423b1c6e4f23aa5bb56354cba9f3135')

prepare() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  patch -p1 < "${srcdir}/python312.diff"
}

build() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  python setup.py build
  python setup.py build_ext --inplace
}

package() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
