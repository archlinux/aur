# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=matrix-reminder-bot
pkgname=python-matrix-reminder-bot
pkgver=0.3.0
pkgrel=1
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

sha256sums=('53376614fb7c9061acf9b920ba00356fd0d0660d659bf829ed4323e1b7e17709'
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
