# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=td-agent
pkgver=2.3.5
pkgrel=1
_pkgrel=0
pkgdesc='Open-Source Log Collector'
arch=('x86_64')
url='http://www.fluentd.org/'
license=('MIT')
options=('!strip')
source=(https://packages.treasuredata.com/2/ubuntu/xenial/pool/contrib/t/td-agent/${pkgname}_${pkgver}-${_pkgrel}_amd64.deb
        td-agent.service)
install=td-agent.install

package() {
  cd "$srcdir"

  tar xf data.tar.gz -C "$pkgdir/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  mkdir -p "$pkgdir/etc/systemd/system"
  install -m644 "$srcdir/td-agent.service" "$pkgdir/etc/systemd/system/"

  mkdir -p "$pkgdir/usr"
  cp -a "$pkgdir/opt/td-agent/usr/sbin" "$pkgdir/usr/bin"

  cp -a "$pkgdir/opt/td-agent/etc/td-agent/logrotate.d" "$pkgdir/etc/logrotate.d"
  mkdir -p "$pkgdir/etc/td-agent"
  cp -a "$pkgdir/opt/td-agent/etc/td-agent/td-agent.conf" "$pkgdir/etc/td-agent/td-agent.conf"
}

# vim: set ft=sh:

sha256sums=('02c1a541429dd4bd8bafea0a8ad54e801ae7c202903153b09dc2a0b57e8e6436'
            'a1202a84c8618b7b0e005037f24492fe82aef2ffeb2925e4e4637dbd56e994c0')
