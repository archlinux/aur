# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=automatic
pkgver=0.8.2
pkgrel=1
pkgdesc="RSS downloader for Linux based systems, capable of adding downloaded torrents directly to Transmission"
arch=('i686' 'x86_64')
url="http://kylek.is-a-geek.org:31337/Automatic/"
license=('GPLv2')
depends=('curl' 'libxml2' 'pcre')
optdepends=('transmission-cli')
backup=('etc/conf.d/automaticd')
source=(https://github.com/1100101/Automatic/archive/v$pkgver.tar.gz
        automaticd.rc
        automaticd.conf
        automatic.service)
sha256sums=('dd98e6faf1011be78f0156ee8ff02c6310aa433edbefea54211cf31f03e709ad'
            '6830dd6b19d233c3d7a7b83ead466b0ea2cb23ee88cd15d5aeffa50716c02d9e'
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
  install -d "$pkgdir/etc/rc.d"
  install -m755 "$srcdir/automaticd.rc" "$pkgdir/etc/rc.d/automaticd"
  install -D -m644 "$srcdir/automaticd.conf" "$pkgdir/etc/conf.d/automaticd"
  install -D -m644 "$srcdir/automatic.service" "$pkgdir/usr/lib/systemd/system/automatic.service"
}

