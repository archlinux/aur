# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=simple_backup
pkgdesc='Simple backup script that uses rsync to copy files'
pkgver=4.1.3
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
depends=('python>=3.10'
         'rsync'
         'python-dotenv')
optdepends=('python-systemd: use systemd log'
            'python-dbus: for desktop notifications'
            'python-paramiko: for remote backup through ssh')
conflicts=('simple_backup-git')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Fuxino/${pkgname}/archive/${pkgver}.tar.gz
        https://github.com/Fuxino/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig)
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')
sha256sums=('1423ac4cbae5b9fef7c99a1447f13f984f9ec365ee13437af5f87f3c0c52582e'
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
    install -Dm644 ${pkgname}/${pkgname}.conf ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.conf
    install -Dm644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
