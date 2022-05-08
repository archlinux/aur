# Contributor: Richard Kakaš <richard.kakas@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=printrun
pkgver=2.0.0rc8
pkgrel=2
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
makedepends=('cython' 'python-setuptools')
source=("https://github.com/kliment/${_projectname}/archive/${_gittag}.tar.gz"
        "python310.diff::https://github.com/kliment/Printrun/commit/faade5b9f33779a9b08286498a15eefd0abd13e0.diff")
sha256sums=('0f62b88ca6745aeb0d72197a767785cee963a321ea92275620d679b03d040196'
            '669f31114882450f1b6be403dfedb3675790d614e4a3a89bcb38db67c9f0567f')

prepare() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  patch -p1 < "${srcdir}/python310.diff"
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
