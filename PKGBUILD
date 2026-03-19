# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sortarr
pkgver=0.8.6
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
optdepends=(
  'sonarr: TV library data'
  'radarr: Movie library data'
  'tautulli: Augment w/ Plex data'
  'jellystat: Augment w/ Jellyfin data'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jaredharper1/Sortarr/archive/${pkgver}.tar.gz"
        'sortarr.tmpfiles'
        'sortarr.service'
        'sortarr.sysusers')

sha256sums=('1e8c80da34789cf83aed53c502b78fcc3c9d8280f1397abf7b87b0de755bacb3'
            'c75ef18ef031d6d022f2cd99fd2fbdfa845b037bee7fd261e53889da64c0b8a6'
            '9b0e3ef5f28883e037fd2ea3d96f6ef2de13f75b44a574bb0feb070ad19a72f2'
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
