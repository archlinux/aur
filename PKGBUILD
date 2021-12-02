# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=wakatime
pkgver=13.1.0
pkgrel=3
pkgdesc="Command line interface used by all WakaTime text editor plugins"
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
        'literal_comparison.patch')
sha256sums=('910c252ff86f649e6e10f88e937062257a3dd71606db728eff49397524b34863'
            'ef526daab8b9656b33893bbeb43d9e9d96ad81a01446bbe0d3035170a7b80163')

prepare () {
  cd "$srcdir/legacy-python-cli-$pkgver"
  patch -Np1 -i "${srcdir}/literal_comparison.patch"
}

build () {
  cd "$srcdir/legacy-python-cli-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/legacy-python-cli-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/
}
