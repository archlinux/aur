# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=matrix-reminder-bot
pkgname=python-matrix-reminder-bot
pkgver=0.2.0
pkgrel=2
pkgdesc="Matrix bot to remind you about stuff."
url="https://github.com/anoadragon453/matrix-reminder-bot"
depends=('python' 'python-matrix-nio' 'python-markdown' 'python-yaml'
         'python-dateparser' 'python-readabledelta' 'python-apscheduler' 'python-pytz')
makedepends=('python-setuptools')
optdepends=('python-psycopg2')
license=('Apache')
arch=('any')
backup=('etc/matrix-reminder-bot/config.yaml')
source=("https://github.com/anoadragon453/${_pkgname}/archive/v${pkgver}.tar.gz"
        "matrix-reminder-bot.service")

sha256sums=('bf346bdf5dfa17219f0cc06c24751404e4d0e0dbcc9a41391c87145032df45b5'
            'ed58a6cb4c10418dfd32a306eba2a22909858881c2bb73eb49cbf7ecaad7bf7e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
   install -Dm644 ${_pkgname}.service "$pkgdir"/usr/lib/systemd/system/${_pkgname}.service
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 sample.config.yaml ${pkgdir}/etc/${_pkgname}/config.yaml
    install -Dm644 sample.config.yaml ${pkgdir}/etc/${_pkgname}/config.yaml
}
