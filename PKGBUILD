# Maintainer: Shatur95 <genaloner@gmail.com>

# Submodule versions
_qonlinetranslator=1.2.4
_qhotkey=1.4.0
_qtaskbarcontrol=2.0.1
_singleapplication=3.1.3.1

pkgname=crow-translate
pkgver=2.4.0
pkgrel=1
pkgdesc='A simple and lightweight translator that allows to translate and say selected text using Google, Yandex and Bing translate API'
arch=(x86_64)
url=https://github.com/crow-translate/crow-translate
license=(GPL3)
depends=(qt5-base qt5-svg qt5-multimedia qt5-x11extras gst-plugins-good openssl)
makedepends=(qt5-tools)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        QOnlineTranslator-$_qonlinetranslator.tar.gz::https://github.com/Shatur95/QOnlineTranslator/archive/$_qonlinetranslator.tar.gz
        QHotkey-$_qhotkey.tar.gz::https://github.com/Skycoder42/QHotkey/archive/$_qhotkey.tar.gz
        QTaskbarControl-$_qtaskbarcontrol.tar.gz::https://github.com//Skycoder42/QTaskbarControl/archive/$_qtaskbarcontrol.tar.gz
        SingleApplication-$_singleapplication.tar.gz::https://github.com/itay-grudev/SingleApplication/archive/v$_singleapplication.tar.gz)
sha256sums=(52bb971e04a3f26b1ab8af87ab450e71de8bf791cfb9396a967e50da8dbb3910
            2d1839aecc0e5a540941aa65653a4d5edad24f73771cef8dd564304b131671bf
            5694f0b35b8051a1d68a2172081f0698bf72aba7f350740d2c6a3fe7de4b0ae3
            b2f956bdc5fdba1477ca7f4bde9759a120055407e4a7cc0c9efbc3934ae72b01
            bbc20faa3e914cda8fe94b5d0bf98af640d3298a791a16cad4571a9ccbf1d030)

# Move submodules into the project
prepare() {
  mv QOnlineTranslator-$_qonlinetranslator/* $pkgname-$pkgver/src/qonlinetranslator
  mv QHotkey-$_qhotkey/* $pkgname-$pkgver/src/third-party/qhotkey
  mv QTaskbarControl-$_qtaskbarcontrol/* $pkgname-$pkgver/src/third-party/qtaskbarcontrol
  mv SingleApplication-$_singleapplication/* $pkgname-$pkgver/src/third-party/singleapplication
}

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  cmake --build .
}

package() {
  cd $pkgname-$pkgver/build

  cmake --install .
  rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
} 
