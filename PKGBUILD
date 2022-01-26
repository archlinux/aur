# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-tubes
pkgver=0.2.0
pkgrel=7
arch=(any)
pkgdesc='A data-processing and flow-control engine for event-driven programs'
url='https://github.com/twisted/Tubes'
license=(MIT)
depends=(python python-characteristic python-six python-twisted)
makedepends=(python-setuptools)
source=("https://github.com/twisted/tubes/archive/v$pkgver/tubes-v$pkgver.tar.gz"
        "https://github.com/graingert/tubes/commit/e01fc9cbbe48327f9d399c1ee2b0b0dfa6ed6204.patch")
sha512sums=('6039a3059b61f8a0c84d4e10bb47d9f2bb95505b0353cb0f1eefb6942f0ad0d88c9b02ff0d48ed0300d615d3e3203c5e884990cd6d006c2f1dbd18b88fcb2e9e'
            '7bef93c5bbd6d071c1a7f18526608e401d45d6fc8ec91a885affb4ae4fc11da2fa31397cf5f4b1302d7acf3378928fa9105e117ad32c067e2352ae5a8506d1cc')

prepare() {
  cd tubes-$pkgver
  # Part of https://github.com/twisted/tubes/pull/89; for fixing building with setuptools>=59
  patch -Np1 -i ../e01fc9cbbe48327f9d399c1ee2b0b0dfa6ed6204.patch
}

build() {
  cd tubes-$pkgver
  python setup.py build
}

check() {
  cd tubes-$pkgver
  PYTHONPATH=. trial tubes
}

package() {
  cd tubes-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
