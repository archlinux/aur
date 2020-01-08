# Maintainer: mattski <redmattski at gmail dot com>

_pkgname=withings-garmin-v2
pkgname=$_pkgname
pkgver=37
pkgrel=1
pkgdesc="Sync Withing Scale stats to Garmin Connect"
arch=('any')
license=('MIT')
url="https://github.com/jaroslawhartman/withings-garmin-v2"
provides=(${_pkgname})
depends=('python'
         'python-requests'
         'python-simplejson')
source=("${_pkgname}::git://github.com/jaroslawhartman/withings-garmin-v2.git"
        "${_pkgname}.service"
        "${_pkgname}.timer"
        "${_pkgname}.conf")
md5sums=('SKIP'
         'f6481ec8e60e7a719fe22d418a0f074c'
         '7af4ec447a5344fd6071fd6a7bcac170'
         '8c065062c737baae192fadb97a88abc1')

pkgver() {
  cd $_pkgname
  git log --pretty=format: | wc -l
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.timer"
  install -dm755 "$pkgdir/opt/${_pkgname}"
  cp -rp "${srcdir}/${_pkgname}"/* "$pkgdir/opt/${_pkgname}/"
  install -Dm600 "${srcdir}/${_pkgname}.conf" "${pkgdir}/etc/${_pkgname}/${_pkgname}.conf"
}
