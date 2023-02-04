# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=automatic
pkgver=0.9.0
pkgrel=5
pkgdesc="RSS downloader for Linux based systems, capable of adding downloaded torrents directly to Transmission"
arch=('i686' 'x86_64' 'armv7h')
url="http://forum.dsmg600.info/viewtopic.php?id=2291"
license=('GPLv2')
depends=('curl' 'libxml2' 'pcre')
optdepends=('transmission-cli')
backup=('etc/automatic.conf' 'etc/conf.d/automaticd')
source=(https://github.com/1100101/Automatic/archive/v$pkgver.tar.gz
        automaticd.conf
        automatic.service)
sha256sums=('80c22f6c8e954c47e29bef536e6cd1cee572f2aa2baec6b51d71a11b09b60e1e'
            'ed4cdf8ef72840fdb57b7670d114372bb68153cdfae731d1102687b568a71940'
            'f9bcd54c4def0865898bf71abbef1107f442478a4d2bcef28b1c5061dae05af1')

build() {
  cd "$srcdir/Automatic-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package () {
  cd "$srcdir/Automatic-$pkgver"
  
  make DESTDIR="$pkgdir/" install
  install -D -m644 "src/automatic.conf-sample" "$pkgdir/etc/automatic.conf"
  install -D -m644 "$srcdir/automaticd.conf" "$pkgdir/etc/conf.d/automaticd"
  install -D -m644 "$srcdir/automatic.service" "$pkgdir/usr/lib/systemd/system/automatic.service"
}
