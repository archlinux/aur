# PKGBUILD

# Maintainer: Daniele Fucini <dfucini@gmail.com>

pkgname=simple_backup
pkgdesc='Simple backup script that uses rsync to copy files'
pkgver=3.2.6
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
sha256sums=('9a441bef4d0948d3a93fbfba5dc667fc1adbd0c58bba870461b77e76ff505c77'
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
   install -Dm644 ${srcdir}/${pkgname}-${pkgver}/${pkgname}.conf ${pkgdir}/etc/${pkgname}/${pkgname}.conf
}
