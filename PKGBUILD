# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=matrix-reminder-bot
pkgname=python-matrix-reminder-bot
pkgver=0.2.1
pkgrel=3
pkgdesc="Matrix bot to remind you about stuff."
url="https://github.com/anoadragon453/matrix-reminder-bot"
depends=('python' 'python-matrix-nio' 'python-markdown' 'python-yaml'
         'python-dateparser' 'python-readabledelta' 'python-apscheduler' 'python-pytz'
         'python-arrow' 'python-pretty-cron')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-psycopg2')
license=('Apache')
arch=('any')
backup=('etc/matrix-reminder-bot/config.yaml')
source=("https://github.com/anoadragon453/${_pkgname}/archive/v${pkgver}.tar.gz"
        "matrix-reminder-bot.service")

sha256sums=('4cc8372e5ca5f814f0a71b2fa1cf28155475542da0e70b523b5bc85aaf1ef295'
            'ed58a6cb4c10418dfd32a306eba2a22909858881c2bb73eb49cbf7ecaad7bf7e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 ${_pkgname}.service "$pkgdir"/usr/lib/systemd/system/${_pkgname}.service
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 sample.config.yaml ${pkgdir}/etc/${_pkgname}/config.yaml
}
