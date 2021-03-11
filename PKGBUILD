# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=gophervr
pkgver=0.5.1
pkgrel=2
pkgdesc="A 3-D interface to Gopherspace"
arch=('i686' 'x86_64')
url="https://gopher.floodgap.com/gopher/gw?gopher://gopher.floodgap.com:70/1/gophervr"
license=('GPL')
depends=('openmotif')
makedepends=('curl' 'tar' 'imake' 'patch' 'unzip')
optdepends=('xterm: for telnet connections'
            'inetutils: for telnet connections'
            'xv: for image display'
            'sox: for audio playback'
            'lynx: for HTML files')
source=("hershey_path.patch"
        "gophervr.desktop"
        "gophervr_icon.png")
md5sums=('1985131a840223fea895f46803650c8c'
         '357365c3e59262d92e1d0382cd842e53'
         '05f51b00d10f6dac04ca5d03b62e88e1')

build() {
  cd $srcdir
  curl -O "gopher://gopher.floodgap.com:70/9/gophervr/gophervr-src.tar.gz"
  unzip "gophervr-src.tar.gz"

  cd $srcdir/gophervr
  patch libvogl/Makefile $srcdir/hershey_path.patch

  make linux
}

package() {
  cd "$srcdir/gophervr/gophervr"
  mkdir -p $pkgdir/usr/bin
  cp gophervr $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/hershey
  cp futura.hfont $pkgdir/usr/share/hershey
  mkdir -p $pkgdir/usr/share/doc/gophervr
  cp gophervr.help $pkgdir/usr/share/doc/gophervr
  cd $srcdir
  mkdir -p $pkgdir/usr/share/icons
  cp gophervr_icon.png $pkgdir/usr/share/icons
  mkdir -p $pkgdir/usr/share/applications
  cp gophervr.desktop $pkgdir/usr/share/applications
}
