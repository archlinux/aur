# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python38-ephemeral-port-reserve
pkgver=1.1.4
pkgrel=1
pkgdesc='Bind to an ephemeral port'
url='https://github.com/Yelp/ephemeral-port-reserve/'
arch=('any')
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools' 'python38-build' 'python38-installer' 'python38-wheel')
checkdepends=('python38-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e0412ac5ec362cffbd5efeb8c24a47ee36b50f2bf126438816824711f1f34412c903b116e96d4e541183925e7422b8f58bb0b7c5b819090d0f3d063cbf8c9f87')
b2sums=('843ddbfe8b102c10b3166628ba2aa1ef40f3314a74ac5e944e4e6c500f3f0d871424ca37dbbe64bc385352ba3ee9895884e82fd169962db8b6bf96aaf131d078')

build() {
  cd ephemeral-port-reserve-${pkgver}
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd ephemeral-port-reserve-${pkgver}
  PYTHONPATH="build/lib" pytest
}

package() {
  cd ephemeral-port-reserve-${pkgver}
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
