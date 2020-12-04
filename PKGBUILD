# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-server
pkgver=5.5.0
pkgrel=1
pkgdesc="reliable private and pypi.python.org caching server"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'python-py' 'python-appdirs' 'python-attrs'
         'python-itsdangerous' 'python-execnet'
         'python-pyramid' 'python-waitress' 'python-repoze.lru'
         'python-pluggy' 'python-pastedeploy' 'python-passlib'
         'python-argon2_cffi' 'python-strictyaml' 'devpi-common')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'devpi-server.service'
        'devpi-server.install')
install='devpi-server.install'
sha256sums=('11c2609bf6e0b06a6262ea4232a403def26909164ef403faf36b840914f13452'
            '1ebfe9edc2bf0f368162f15540e48a8e046db0023b5da23e98daf43f0e075a95'
            '16c075687426589b69da252f04ee1a2ff0f8e73526eb773c53475d82e827f199')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"

  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
  
  install -d -o 3141 -g 3141 "$pkgdir/var/lib/devpi"
}

# vim:set ts=2 sw=2 et:
