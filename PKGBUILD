# Maintainer: Chris <christopher.r.mullins g-mail>

pkgname=lightscreen
pkgver=2.3
pkgrel=4
pkgdesc='Simple tool to automate the tedious process of saving and cataloging screenshots'
arch=('i686' 'x86_64')
url='http://lightscreen.com.ar/'
depends=('qt5-base'
         'qt5-declarative'
         'qt5-xmlpatterns'
         'qt5-multimedia'
         'qt5-x11extras')
license=('GPL')
source=("lightscreen-$pkgver.tar.gz::https://github.com/ckaiser/Lightscreen/archive/v$pkgver.tar.gz"
        "UGlobalHotkey-231b10.zip::https://github.com/ckaiser/UGlobalHotkey/archive/231b10144741b29037f0128bb7a1cd7176529f74.zip"
	"SingleApplication-c6378e.zip::https://github.com/ckaiser/SingleApplication/archive/c6378eec45a5fdf699b4d27fb4be22a190b2a184.zip"
	"screenshot_cpp_h_fix.patch")
	
sha512sums=('42a8b9a30430e152b0686a14d0ddb9e511865fc73f0a8ed6b66f80460829148b889d5b53077162d45440e979648fb951dd598000ddc8c4a3256bce73d775cff9'
            '444486f71c6cee80fc2b7bbd0b75335c1eefc8b8c949fb83438d2761c28c89fb345ad99b0195f8726c03984e30c46bf4788168927c28725beb3b31d0349e0778'
	    'ca3ab82c9a98180218afb0936b87b8f156def8ef4d84926930c81ef3c12ae66807d4f27b403bd01b6c8b1def5507ac9b47017b38c44ce7e5dd3119bc0dcce17b'
	    '67193adc30beee7e9fdb72bbcc5d06960ac2b4f7125f7924c9f4d43ea4459d8bf3a79db3f4f4fc2e0a888a298744a13030e1bc708b2693238aa9691ff7ee7e5f')

prepare() {
  cd "${srcdir}"/"Lightscreen-${pkgver}"
  patch -Np0 -i ../screenshot_cpp_h_fix.patch
  cd "${srcdir}"
  cp UGlobalHotkey-231b10144741b29037f0128bb7a1cd7176529f74/* "${srcdir}"/"Lightscreen-${pkgver}/tools/UGlobalHotkey"  
  cp SingleApplication-c6378eec45a5fdf699b4d27fb4be22a190b2a184/* "${srcdir}"/"Lightscreen-${pkgver}/tools/SingleApplication"
  cd "${srcdir}"/"Lightscreen-${pkgver}"
}

build() {
  cd "Lightscreen-$pkgver"
  qmake-qt5
  make
}

package() {
  install -D -m755 "Lightscreen-$pkgver/lightscreen" "$pkgdir/usr/bin/lightscreen" 
}
