# Maintainer: David Runge <dvzrv@archlinux.org>

_name=husl
pkgname=python-husl
pkgver=4.0.3
pkgrel=11
pkgdesc="A Python implementation of HUSL (revision 3)"
arch=(any)
url="https://pypi.org/project/husl/"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  LICENSE
)
sha512sums=('1df5e08b24c3b815e4bf643d8bfc911aeeff25328565123122efb2a7042aea1e6e7709ed9d2c6a42390a0cece98863813a83952964c7df1dfcdc566671858034'
            'd796b5bec7d325a897541d9fd2712fa83bb88babd4744e7ff28202f8db153696660f1d1b2e95f0fee618d98a83ae7fb635e4a412ab9c8de30f0cb27f287a4251')
b2sums=('9824a50904c880d35a0a0b1efa402e7b5267db4df2ddea2114acc14b416da8bdac39f1383703abfd3a64f55680ac398e3479a6f2c9df1017b9eb265513172462'
        'f1a4ac3501cb1c5a6a1ba7b648aad71adf552b693dcfe99e805b9d6b89ad6c1ee1aa1ce990eb742b9484bdb8566f2830175f20f910ef31cfc74ad998c55de0f8')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: tests are not included. upstream contacted

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # license file not available. former maintainer contacted
  install -vDm 644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
