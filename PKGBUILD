# Maintainer:

pkgname=zoomtools
pkgver=12222006
pkgrel=6
pkgdesc="Tools for the Zoom PS-02, PS-04, MRS-8 multitrack recorders"
arch=('i686' 'x86_64')
url="http://www.engens.com/dwight/software.html"
license=('GPL')
depends=('glibc' 'gtk2')
makedepends=('pangox-compat')
options=('!makeflags')
source=("http://www.engens.com/dwight/dl/$pkgname-12222005.tar.gz"
        "zoomtools.patch")
sha256sums=('9a78ff8c78d52e3446e5b8c5c946d79a6a720ec61d317886e02985566591e963'
            '4fe9135420d926786a87283b5ea0600f08f185de26ab2a5798bc70c6aaeb03c4')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../zoomtools.patch
}

build() {
  cd $pkgname-$pkgver
  make

  cd gui
  make
}

package() {
  cd $pkgbase-$pkgver
  install -d "$pkgdir"/usr/bin
  install -m 755 cmdline/{mid2seq,mrs8_bintool,ps02_to_ps04,ps02_tool,ps04_tool,zoom2wav} \
    gui/{mrs8,ps02} "$pkgdir"/usr/bin
}
