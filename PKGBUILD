# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=circus
pkgver=0.18.0
pkgrel=1
pkgdesc="program that will let you run and watch multiple processes and sockets"
arch=('any')
url="http://circus.readthedocs.org"
license=('Apache')
depends=('python-psutil' 'python-pyzmq' 'python-tornado')
makedepends=(python-build python-installer python-wheel python-flit-core)
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/circus-tent/circus/archive/${pkgver}.tar.gz"
        "circus.ini"
        "circus.service")
b2sums=('4afa75f4e43d322b804f704a87ae31597c2a5b9514afb7a4508f58ea9d5ab8f3f0edc1799e4dd8033878521ae1d3a2b2b9e2b7d7943ff9690243f2d07c6c8045'
        'bc290e4a45cef64b2525dc4022fbddbbea7598d2a6a461386ab849f02c851f41bd5f03e29bf32064ac1efd83cf73e957b7cd3181b2bd2ad9b48bd11f11eeb59a'
        '69d6aaa98b4fbb5ce73c093101252c9396a4c68cd77d0344b67dcccc0076aa2bb75e0202fef8d6f688f879b6c19e9616dc5c3070845ab72584ac61de55fa2426')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 "$srcdir"/circus.ini "$pkgdir"/etc/circus/circus.ini
  install -Dm 644 "$srcdir"/circus.service "$pkgdir"/etc/systemd/system/circus.service
}
