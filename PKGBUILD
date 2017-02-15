# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>

pkgname=grafana-bin
_pkgname=grafana
pkgver="4.1.2"
_pkgver="4.1.2-1486989747"
pkgrel=1
pkgdesc="A general purpose dashboard and graph composer. It supports graphite, influxdb or opentsdb - binary version"
url="http://grafana.org"
conflicts=('grafana')
provides=('grafana')
arch=('x86_64')
license=('Apache')
install=${_pkgname}.install
backup=("etc/${_pkgname}/${_pkgname}.ini")
source=("https://grafanarel.s3.amazonaws.com/builds/${_pkgname}-${_pkgver}.linux-x64.tar.gz"
        "grafana.service")
sha256sums=('b8111cd014e9c202dd1b168b924731a140161e9e43e32f3ca7ae18db850af6c4'
            '44ceb7aad648c8e46a65026109fc0327bc6e01ba7060d97d9e83a3e8ad65379c')


package() {
  install -Dm644 "${srcdir}/grafana.service" "$pkgdir/usr/lib/systemd/system/grafana.service"
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -dm755 "${pkgdir}/var/lib/grafana"
  install -dm755 "${pkgdir}/var/log/grafana"
  install -Dm755 bin/grafana-server "$pkgdir/usr/bin/grafana-server"
  install -Dm755 bin/grafana-cli "$pkgdir/usr/bin/grafana-cli"
  install -Dm644 conf/sample.ini "$pkgdir/etc/${_pkgname}/${_pkgname}.ini"
  install -Dm644 conf/defaults.ini "$pkgdir/usr/share/grafana/conf/defaults.ini"
  cp -r vendor public "$pkgdir/usr/share/grafana/"
}
