# Maintainer: mooow <9mvnyapkt@mozmail.com>
# Thanks: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Jared Casper <jaredcasper@gmail.com>
# Thanks: Kyle Keen <keenerd@gmail.com>
# Thanks: Markus Koch <CClassicVideos@aol.com>
# Thanks: Thomas Dziedzic < gostrc at gmail >

pkgname=gtkwave-gtk3-tcl
pkgver=3.3.117
pkgrel=1
pkgdesc='A wave viewer which reads LXT, LXT2, VZT, GHW and VCD/EVCD files (GTK+ 3 version, with Tcl/Tk support)'
arch=('x86_64')
url='http://gtkwave.sourceforge.net'
license=('GPL' 'MIT')
depends=('bzip2' 'xz' 'gtk3' 'desktop-file-utils' 'dconf' # Original gtkwave dependencies
'tcl' 'tk'
)
makedepends=('gperf')
conflicts=(gtkwave)
provides=(gtkwave)
install='gtkwave.install'
source=("https://gtkwave.sourceforge.net/gtkwave-gtk3-${pkgver}.tar.gz")
sha256sums=('3cf1537586a911cbb0601af8fa18cf6da708c8a14a71f69ce3cb9118e8571db9')

build() {
  cd gtkwave-gtk3-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-tcl \
    --disable-mime-update \
    --with-gsettings \
    --enable-gtk3

  make CFLAGS="-D_LARGEFILE64_SOURCE -O"
}

package() {
  cd gtkwave-gtk3-$pkgver

  make DESTDIR="${pkgdir}" install

  install -D -m644 LICENSE.TXT \
    "$pkgdir/usr/share/licenses/gtkwave/LICENSE.TXT"
}
