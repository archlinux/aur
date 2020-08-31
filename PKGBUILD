# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=python-foolbox-git
_name=foolbox
pkgdesc="Toolbox to create adversarial examples that fool neural networks in PyTorch, TensorFlow, Keras,"
pkgver=3.1.1.r0.gef30f7f
pkgrel=1
arch=(any)
url='https://github.com/bethgelab/foolbox'
license=(MIT)
provides=('python-foolbox')
conflicts=('python-foolbox')
depends=('python-numpy' 'python-scipy' 'python-gitpython' 'python-requests' 'python-eagerpy')
makedepends=(
  'python-setuptools' 'git'
)
options=(!emptydirs)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/$_name"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

