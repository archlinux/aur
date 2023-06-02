# PKGBUILD

# Maintainer: Daniele Fucini <dfucini@gmail.com>

pkgname=simple_backup
pkgdesc='Simple backup script that uses rsync to copy files'
pkgver=3.2.8
pkgrel=1
epoch=1
url="https://github.com/Fuxino/${pkgname}"
install=simple_backup.install
arch=('any')
license=('GPL3')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
depends=('python'
         'rsync'
         'python-dotenv')
optdepends=('python-systemd: use systemd log'
            'python-dbus: for desktop notifications')
conflicts=('simple_backup-git')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Fuxino/${pkgname}/archive/${pkgver}.tar.gz
        https://github.com/Fuxino/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig)
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')
sha256sums=('844bf041d5b2e5db0fea74c28b002ca569e2ed50605f9323f03467f269d5e2cd'
            'SKIP')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    python -m installer --destdir=${pkgdir} dist/*.whl
    install -Dm644 ${pkgname}.conf ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.conf
    install -Dm644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
