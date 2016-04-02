# Maintainer: Chris <christopher.r.mullins g-mail>

pkgname=lightscreen
pkgver=2.2
pkgrel=3
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
        "fix_optionsdialog_include.patch"
        "UGlobalHotkey-5dc7c1.zip::https://github.com/ckaiser/UGlobalHotkey/archive/5dc7c1738c08b6bd3cc814923584ca3ea61465d3.zip"
        "SingleApplication-2a9983.zip::https://github.com/ckaiser/SingleApplication/archive/2a99832aee351919a04b8a28876fc9543d01f19f.zip"
        "fix_hotkeymap_h.patch")
sha512sums=('4a3056c5d7a91790db58ed14c7f264cca39ce4baf565684d3ae8cacf405dabfcb30d0547e4a5b69694507023424c827dc0ccf88fcfcebd01fb8d14a521e7b8f7'
            'c4ea7c0be83b989c1b971eb8b73686ffe52467d0d2e6d21ebb6e700961626612388411d9984df8d0a1c0748196db0ec4f9da125b398d4668e97e0566a1b20606'
            '399d492607c8e259206e7e0acded769ec13ed405027c31e631e9a75691802fbd4d942c9f2ffd54a7d53d850e60cc1d8ad3a719fc8231a244cfea62b8c29a66a9'
            '6d2f6fd7cb3d8e8f90735f3b1752c167d80a19137a35f1a00635b56fa024bde3f4cd5af4b231687178979d4903ac6d9dcaa0ea7098967300db7c5ed08856c00a'
            '5b049eae8e9b883dd9d57893fb3ea053c461a9758e9b71042918c3d13802815c7ac66cc9ee6dfe6b978e7ed9f7a7f4fed71ea007c53b3cfef6309fb7d3c44bbc')

prepare() {
  cd "${srcdir}"/"Lightscreen-${pkgver}"
  patch -Np0 -i ../fix_optionsdialog_include.patch
  cd "${srcdir}"
  cp UGlobalHotkey-5dc7c1738c08b6bd3cc814923584ca3ea61465d3/* "${srcdir}"/"Lightscreen-${pkgver}/tools/UGlobalHotkey"  
  cp SingleApplication-2a99832aee351919a04b8a28876fc9543d01f19f/* "${srcdir}"/"Lightscreen-${pkgver}/tools/SingleApplication"
  cd "${srcdir}"/"Lightscreen-${pkgver}"
  patch -Np0 -i ../fix_hotkeymap_h.patch
}

build() {
  cd "Lightscreen-$pkgver"
  qmake-qt5
  make
}

package() {
  install -D -m755 "Lightscreen-$pkgver/lightscreen" "$pkgdir/usr/bin/lightscreen" 
}
