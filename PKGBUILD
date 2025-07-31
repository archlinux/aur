# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=simple_backup
pkgdesc='Simple backup script that uses rsync to copy files'
pkgver=4.1.6
pkgrel=2
url="https://git.shouldnt.work/fuxino/${pkgname}"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('git'
             'python-setuptools'
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
source=(git+${url}?signed#tag=${pkgver})
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')
sha256sums=('b3b29d9e2e1b7b949e95674d9a401e8eeb0d5f898e8450473dce94f799ee9df3')

build()
{
    cd ${srcdir}/${pkgname}
    python -m build --wheel --no-isolation
}

package()
{
    cd ${srcdir}/${pkgname}
    python -m installer --destdir=${pkgdir} dist/*.whl
    install -Dm644 ${pkgname}/${pkgname}.conf ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.conf
    install -Dm644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
