# PKGBUILD

# Maintainer: Daniele Fucini <dfucini@gmail.com>

pkgname=simple_backup
pkgdesc='Simple backup script that uses rsync to copy files'
pkgver=3.2.5
pkgrel=2
epoch=1
url="https://github.com/Fuxino/${pkgname}"
install=simple_backup.install
arch=('any')
license=('GPL3')
makedepends=('git'
             'python-setuptools'
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
sha256sums=('fd418a9c641d604c64bd0a8487b5ab431ff71f192d6021e55b194085951cb40d'
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
