# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=python-eagerpy-git
_name=eagerpy
pkgdesc="Toolbox to create adversarial examples that fool neural networks in PyTorch, TensorFlow, Keras,"
pkgver=0.29.0.r0.g2acb7f9
pkgrel=1
arch=(any)
url='https://github.com/jonasrauber/eagerpy'
license=(MIT)
provides=('python-eagerpy')
conflicts=('python-eagerpy')
optdepends=('python-pytorch: PyTorch functionality' 'python-tensorflow: TensorFlow functionality' 'python-jax: Jax functionality')
depends=('python-numpy')
makedepends=(
  'python-setuptools' 'git'
)
checkdepends=('python-pytest' 'python-pytest-runner')
options=(!emptydirs)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


check() {
    cd $srcdir/$_name
    python setup.py pytest
}

package() {
  cd "${srcdir}/$_name"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

