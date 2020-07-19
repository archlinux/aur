# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=td-agent
pkgver=3.7.1
pkgrel=1
_pkgrel=0
pkgdesc='Open-Source Log Collector'
arch=('x86_64')
url='https://www.fluentd.org/'
license=('MIT')
options=('!strip')
source=(https://packages.treasuredata.com/3/ubuntu/bionic/pool/contrib/t/td-agent/${pkgname}_${pkgver}-${_pkgrel}_amd64.deb)
install=td-agent.install

package() {
  cd "$srcdir"

  tar xf data.tar.gz -C "$pkgdir/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  mkdir -p "$pkgdir/usr"
  cp -a "$pkgdir/opt/td-agent/usr/sbin" "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/etc/logrotate.d"
  cp "$pkgdir/opt/td-agent/etc/td-agent/logrotate.d/td-agent.logrotate" "$pkgdir/etc/logrotate.d/td-agent"

  mkdir -p "$pkgdir/etc/td-agent"
  cp "$pkgdir/opt/td-agent/etc/td-agent/td-agent.conf" "$pkgdir/etc/td-agent/td-agent.conf"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp "$pkgdir/opt/td-agent/etc/systemd/td-agent.service" "$pkgdir/usr/lib/systemd/system/td-agent.service"
}

# vim: set ft=sh:

sha512sums=('af5539a594ae5171030c4900239df43d264198370eaa6999c2002291b7d5e94e6d4647f7e6ef42deddf464d82a05cc7990118a0154f262e8dc8f09a8492e76c3')
