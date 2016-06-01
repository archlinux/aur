# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-server
pkgver=4.0.0
pkgrel=1
pkgdesc="reliable private and pypi.python.org caching server"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'python-py' 'python-itsdangerous' 'python-execnet'
         'python-pyramid' 'python-waitress' 'python-repoze.lru'
         'python-pluggy' 'python-pastedeploy' 'devpi-common')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'devpi-server.service'
        'devpi-server.install')
install='devpi-server.install'
sha256sums=('f7dba7e6af4b5dc44a9b2c212fd2a443f9dba3d32a4937366d1ef57c79b3825e'
            'SKIP'
            'SKIP')

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
