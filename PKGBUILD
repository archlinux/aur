# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>

pkgbase=gunicorn
pkgname=(gunicorn gunicorn-python2)
pkgver=19.4.5
pkgrel=2
pkgdesc='WSGI HTTP Server for UNIX'
arch=(any)
url='http://gunicorn.org/'
license=(MIT)
makedepends=(python-distribute python2-distribute)
source=("https://github.com/benoitc/${pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('b00921adb5c7d786b2b22416a03d0e4586209d754c1dde302c10981bcbf09fe0')

package_gunicorn() {
  depends=(python)
  optdepends=(
    'python-eventlet: For asynchronous request handling with eventlet.'
    'python-gevent: For asynchronous request handling with gevent.'
  )

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/bin/gunicorn_django" "${pkgdir}/usr/bin/gunicorn_paster"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_gunicorn-python2() {
  depends=(python2)
  provides=(python2-gunicorn)
  conflicts=(python2-gunicorn)
  optdepends=(
    'python2-eventlet: For asynchronous request handling with eventlet.'
    'python2-gevent: For asynchronous request handling with gevent.'
  )

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/bin/gunicorn_django" "${pkgdir}/usr/bin/gunicorn_paster"
  mv "${pkgdir}/usr/bin/gunicorn" "${pkgdir}/usr/bin/gunicorn-python2"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
