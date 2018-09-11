# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=class
_python=python
pkgname=${_python}-$_modulename
pkgver=2.7.0
pkgrel=1
pkgdesc="CLASS: Cosmic Linear Anisotropy Solving System"
arch=(any)
url="https://github.com/lesgourg/class_public"
license=()
groups=()
depends=('cython')
makedepends=("${_python}-setuptools")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aad63f9d12e557000ef84f4cc5644b39d056e5a0c639deb1c2682af7f1328d91')
package() {
  cd "$srcdir/class_public-${pkgver}/"
  make -j libclass.a
  cd python
  sed -i 's/libraries=\["class"\]/libraries=["class", "mvec", "m"]/' setup.py
  ${_python} setup.py install --root="$pkgdir/" --optimize=1
}
