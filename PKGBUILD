# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>

pkgbase=gunicorn
pkgname=(gunicorn gunicorn-python2)
pkgver=19.3
pkgrel=1
pkgdesc='WSGI HTTP Server for UNIX'
arch=(any)
url='http://gunicorn.org/'
license=(MIT)
makedepends=(python-distribute python2-distribute)
source=("https://github.com/benoitc/${pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('06279932c743286f6420e32638c8c581db688d31aa75fcb719ed63bc2a36d7f0')

package_gunicorn() {
  depends=(python)
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/bin/gunicorn_django" "${pkgdir}/usr/bin/gunicorn_paster"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_gunicorn-python2() {
  depends=(python2)
  provides=(python2-gunicorn)
  conflicts=(python2-gunicorn)
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/bin/gunicorn_django" "${pkgdir}/usr/bin/gunicorn_paster"
  mv "${pkgdir}/usr/bin/gunicorn" "${pkgdir}/usr/bin/gunicorn-python2"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
