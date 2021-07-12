# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=magic-wormhole-mailbox-server
pkgver=0.4.1
pkgrel=1
pkgdesc="the rendezvous/mailbox server for magic-wormhole clients "
arch=('any')
url="https://github.com/magic-wormhole/magic-wormhole-mailbox-server"
license=('MIT')
depends=('python-twisted' 'python-autobahn')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-treq')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/magic-wormhole/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d174d1bf901e7d21d7cb77ceffd6b9c7aa3c15433e11862365883d93437225c7c655b8338a5cad7bd5c60d7dd7d3dd017ef7e26213b535c043ce75000a540597')
b2sums=('4bf6bc9fa6dacaafb532d9d0ee069bb89ba63feb790f0f9c0d1117b1de4f075eb9dd3bf5c72a9df472e9dedc31dcd9292dc1820da770738fd9d0d29cb3bcf68a')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "${pkgname}-${pkgver}"
	python setup.py test
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -vDm 644 docs/*.md -t "${pkgdir}/usr/share/docs/${pkgname}"
}
