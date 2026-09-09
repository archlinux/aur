# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=ownfoil
pkgver=2.4.1
pkgrel=1
pkgdesc='Switch library manager, with a self-hosted Tinfoil Shop'
arch=('any')
url='https://github.com/a1ex4/ownfoil'
license=('custom')
depends=(
  'python'
  'python-flask'
  'python-flask-sock'
  'python-flask-login'
  'python-flask-migrate'
  'python-flask-sqlalchemy'
  'python-yaml'
  'python-nstools'
  'python-requests'
  'python-watchdog'
  'python-werkzeug'
  'python-zstandard'
  'python-setproctitle'
  'python-strawberry-graphql'
  'gunicorn'
  'nsz'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        'ownfoil.service'
        'ownfoil.sysusers'
        'ownfoil.tmpfiles'
)
sha256sums=('d6aa58a0bdaad3b85a1283fd36ff48ed7b7b5cb2c2c2818bcc09205df5d7f988'
            '6125cf80726fc954208f5daf6dfce3836f94ed019d307454185ca7414021f11f'
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
