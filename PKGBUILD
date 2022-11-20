# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Melissa Padilla <mpadilla2 at hotmail dot com>

pkgname=python38-future
pkgver=0.18.2
pkgrel=7
pkgdesc="Clean single-source support for Python 3 and 2"
url="https://python-future.org/"
arch=('any')
license=('MIT')
depends=('python38')
provides=('futurize' 'pasteurize')
checkdepends=('python38-requests')
makedepends=('python38-setuptools')
optdepends=('python38-setuptools: futurize and pasteurize scripts')
options=('!emptydirs')
source=("https://pypi.io/packages/source/f/future/future-$pkgver.tar.gz")
sha512sums=('91c025f7d94bcdf93df838fab67053165a414fc84e8496f92ecbb910dd55f6b6af5e360bbd051444066880c5a6877e75157bd95e150ead46e5c605930dfc50f2')

build() {
  cd "$srcdir"/future-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/future-$pkgver
#PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python3.8 setup.py test || warning "Tests failed"
}

package() {
  cd future-$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
