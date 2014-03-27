# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=automatic
pkgver=0.8.3
pkgrel=2
pkgdesc="RSS downloader for Linux based systems, capable of adding downloaded torrents directly to Transmission"
arch=('i686' 'x86_64')
url="http://forum.dsmg600.info/viewtopic.php?id=2291"
license=('GPLv2')
depends=('curl' 'libxml2' 'pcre')
optdepends=('transmission-cli')
backup=('etc/conf.d/automaticd')
source=(https://github.com/1100101/Automatic/archive/v$pkgver.tar.gz
        automaticd.conf
        automatic.service)
sha256sums=('1b5c5c65989d12dc7dcdd031dd7d0c1efad80062d615f63836ac86bd010908b8'
            'ed4cdf8ef72840fdb57b7670d114372bb68153cdfae731d1102687b568a71940'
            'eea406171cd80ca5efae3b7a95a87eb316836550fd6f6fd42c16697738ff02b0')

build() {
  cd "$srcdir/Automatic-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package () {
  cd "$srcdir/Automatic-$pkgver"
  
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir/automaticd.conf" "$pkgdir/etc/conf.d/automaticd"
  install -D -m644 "$srcdir/automatic.service" "$pkgdir/usr/lib/systemd/system/automatic.service"
}

