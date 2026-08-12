# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=ownfoil
pkgver=2.3.0
pkgrel=2
pkgdesc='Switch library manager, with a self-hosted Tinfoil Shop'
arch=('any')
url='https://github.com/a1ex4/ownfoil'
license=('custom')
depends=(
  'python'
  'python-croniter'
  'python-flask'
  'python-flask-login'
  'python-flask-migrate'
  'python-flask-sqlalchemy'
  'python-yaml'
  'python-requests'
  'python-unzip-http'
  'python-watchdog'
  'python-werkzeug'
  'python-zstandard'
  'nsz'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        'ownfoil.service'
        'ownfoil.sysusers'
        'ownfoil.tmpfiles'
)
sha256sums=('488516a446a0236a78b30fa452c9cf3a1dde49dc0b7db62b91a51cab9015a870'
            '528de3cc691edb57a44e512024832a1a1d0947dbbcda84e487b033150edc6193'
            'aee7a6c72d655e29365fe266165ffb714666507a9536871500ced59e0f5d992f'
            'abe899a8eecb080f3b938c2441e09838a539f6bfc00e8207ade74bb18c1a5a12')

package()
{
  install -m0755 -d "${pkgdir}"/usr/lib/ownfoil
  cp -dr --no-preserve='ownership' "${srcdir}/${pkgname}-${pkgver}"/app/. "${pkgdir}"/usr/lib/ownfoil

  ln -s /var/lib/ownfoil "${pkgdir}"/usr/lib/ownfoil/config
  ln -s /var/lib/ownfoil "${pkgdir}"/usr/lib/ownfoil/data

  install -Dm0644 "${srcdir}"/ownfoil.sysusers "${pkgdir}"/usr/lib/sysusers.d/ownfoil.conf
  install -Dm0644 "${srcdir}"/ownfoil.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/ownfoil.conf
  install -Dm0644 "${srcdir}"/ownfoil.service  "${pkgdir}"/usr/lib/systemd/system/ownfoil.service
}
