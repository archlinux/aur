# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-server
pkgver=4.2.0
pkgrel=2
pkgdesc="reliable private and pypi.python.org caching server"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'python-py' 'python-itsdangerous' 'python-execnet'
         'python-pyramid' 'python-waitress' 'python-repoze.lru'
         'python-pluggy' 'python-pastedeploy' 'python-passlib'
         'python-argon2_cffi' 'devpi-common')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'devpi-server.service'
        'devpi-server.install')
install='devpi-server.install'
sha256sums=('bfdc5811b468dcfb08177780ea84ff58c31cc54bc28d8698befd8d989d13062a'
            '538aa64a3c88e55b971e4d249159228fb919802433191bbbd13e73c5e537c0b7'
            '16c075687426589b69da252f04ee1a2ff0f8e73526eb773c53475d82e827f199')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"

  install -dm755 "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
  
  install -dm755 -o 3141 -g 3141 "$pkgdir/var/lib/devpi"
}

# vim:set ts=2 sw=2 et:
