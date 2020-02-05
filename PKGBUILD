# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.7.1
pkgrel=1
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-telethon-session-sqlalchemy' 'python-telethon' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix' 'python-aiohttp' 'python-magic-ahupp')
makedepends=('python3')
install=mautrix-telegram.install
license=('AGPLv3')
arch=('any')
source=("https://github.com/tulir/mautrix-telegram/archive/v${pkgver}.tar.gz"
        'mautrix-telegram.service')
sha256sums=('14ed98a1bc87673562b806b8b3b8dfe2293c616281a1965ceabb55c8768594fd'
            '5aade6c1041f8fe741e239d191e52b4617dae0092e6aed068e2dc713789fbc37')

build() {
    cd $srcdir/mautrix-telegram-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/mautrix-telegram-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
    mkdir -pm0755 ${pkgdir}/etc/mautrix-telegram ${pkgdir}/usr/lib/systemd/system/
    mv ${pkgdir}/usr/{alembic,alembic.ini,example-config.yaml} ${pkgdir}/etc/mautrix-telegram/
    rm -rf ${pkgdir}/usr/lib/python3.8/site-packages/tests
    cp ../mautrix-telegram.service ${pkgdir}/usr/lib/systemd/system/
}
