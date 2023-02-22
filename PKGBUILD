# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Harley Wiltzer <harleyw@hotmail.com>
# Contributor: Filip Grali?ski <filipg at ceti dot pl>
# Contributor: Andrei Shadrikov <notvuvko@gmail.com>

pkgname='python-hydra-core'
pkgver='1.3.1'
pkgrel=1
pkgdesc='A framework for elegantly configuring complex applications'
arch=('any')
url='https://hydra.cc'
license=('MIT')
depends=('python-omegaconf' 'python-antlr4' 'java-environment')
makedepends=('antlr4' 'java-runtime>=11', 'python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-packaging')
source=("$pkgname-$pkgver::https://github.com/facebookresearch/hydra/archive/refs/tags/v${pkgver}.tar.gz"
        "antlr4-jar.patch")
sha256sums=('9ba1efe09893853e883498fcbeec17f2a77e1ba551587d6d0604077e02de1602'
            '9db3a15d9c32cc754d19efbe0065025612ed6cd0d68d948ccebd5dc6544aadc6')

_pkgname=hydra

prepare() {
    pwd
	patch -p1 -d "$_pkgname-$pkgver" < antlr4-jar.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
