# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Harley Wiltzer <harleyw@hotmail.com>
# Contributor: Filip Grali?ski <filipg at ceti dot pl>
# Contributor: Andrei Shadrikov <notvuvko@gmail.com>

pkgname='python-hydra'
pkgver='1.2.0'
pkgrel=1
pkgdesc='A framework for elegantly configuring complex applications'
arch=('any')
url='https://hydra.cc'
license=('MIT')
depends=('python-omegaconf')
provides=('python-hydra-core')
conflicts=('python-hydra-core')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver::https://github.com/facebookresearch/hydra/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19b203fc614426cd6e4bb7c51e73a25a1ceb4606450ec0203345aec67a0a4f6a')

_pkgname=${pkgname/python-/}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
