# Maintainer: Midov <midov@midov.pl>

pkgname=pantalaimon
pkgver=0.3.1
pkgrel=2
pkgdesc='Pantalaimon is an end-to-end encryption aware Matrix reverse proxy daemon.'
arch=('any')
url='https://github.com/matrix-org/pantalaimon'
license=('Apache')
depends=('python' 'libolm' 'matrix-nio' 'python-prompt_toolkit' 'python-janus' 'python-peewee' 'python-logbook' 'python-aiohttp' 'python-cachetools' 'python-pycryptodome' 'python-unpaddedbase64' 'python-h2' 'python-h11' 'python-notify2' 'python-pydbus' 'python-olm' 'python-jsonschema' 'python-atomicwrites' 'python-click' 'python-keyring' 'python-future')
source=("https://github.com/matrix-org/pantalaimon/archive/crypto_debug.tar.gz"
        "${pkgname}.service")
sha256sums=('062d5f05139742dbebe54c6a460fc5c90bcd6f6c6502978bd0c79fe3268ea12f'
            'cf693e0324a7f2965bc9e64ab2c3d75137e7993503ddb3ae3dddc84af6c0b0e9')

build() {
	cd pantalaimon-crypto_debug
}

package() {
	cd pantalaimon-crypto_debug
	python setup.py install --prefix=/usr --root="$pkgdir"
	install -D -m 644 "${srcdir}/pantalaimon.service" ${pkgdir}/usr/lib/systemd/user/pantalaimon.service
}

