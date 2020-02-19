# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=td-agent
pkgver=3.6.0
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

sha512sums=('240cad564611b31573b9b6c3d72370609ddce309ac8818efa40937379cb7d82a52fd7f52b351c6d8c2adee4f71c81981fd3059c3eccc564c2046924429cd4684')
