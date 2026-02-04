# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sortarr
pkgver=0.8.0
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/Jaredharper1/Sortarr"
license=('GPL')
makedepends=(
  'python-setuptools'
)
depends=(
  'python-flask'
  'python-flask-compress'
  'python-flask-babel'
  'python-waitress'
  'python-requests'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jaredharper1/Sortarr/archive/$pkgver.tar.gz"
        'sortarr.tmpfiles'
        'sortarr.service'
        'sortarr.sysusers')

sha256sums=('1fa73b326738c282267418112c8c546e8ea16851556f21e4c33aef16c59d7044'
            'de7f8d7c30c7758de371369345922430e255eaa1675aa18ad0a18dbe03d2fa72'
            'e19eb73522e9f57e6eefb492529e0afda787972fcb7a514ca449307ffb395937'
            'ba7dec1d29aa45936979bffbcfcd2e64d849ac911fd507f1aad0ca229df9725c')

package() {
  cd "${srcdir}/Sortarr-${pkgver}"

  install -D -m 755 app.py "${pkgdir}/usr/lib/sortarr/app.py"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/sortarr/LICENSE"

  cp -a docs/ static/ templates/ translations/ "${pkgdir}/usr/lib/sortarr/"

  install -D -m 644 "${srcdir}/sortarr.service" "${pkgdir}/usr/lib/systemd/system/sortarr.service"
  install -D -m 644 "${srcdir}/sortarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/sortarr.conf"
  install -D -m 644 "${srcdir}/sortarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sortarr.conf"
}
