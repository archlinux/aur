# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Modified from python-imgaug
# Contributor: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-imgaug-git
pkgver=0.4.0.r41.g0101108d
pkgrel=1
pkgdesc="Image augmentation for machine learning experiments"
url="https://github.com/aleju/imgaug"
depends=('python-opencv' 'python-six' 'python-numpy' 'python-scipy' 'python-scikit-image')
makedepends=('python-setuptools' 'git')
provides=('python-imgaug')
conflicts=('python-imgaug')
license=('MIT')
arch=('any')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
    cd $srcdir/imgaug
    sed -i '/"opencv-python-headless",/d' setup.py
}

pkgver() {
  cd imgaug
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/imgaug
    python setup.py build
}

package() {
    cd $srcdir/imgaug
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
