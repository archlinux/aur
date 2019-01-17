# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=td-agent
pkgver=3.2.1
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

sha512sums=('d13219ad4f9a245400d74f49066c840283303cd409fb1aef3e50de1e15a2fbb5386c4b1869c04df4a5b15f9272dff19685234fe49c70e0d714793be7099ca91f')
