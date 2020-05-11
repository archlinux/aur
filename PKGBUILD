# Maintainer: Shatur95 <genaloner@gmail.com>

# Submodule versions
_qonlinetranslator=1.2.3
_qhotkey=1.3.0
_qtaskbarcontrol=2.0.0
_singleapplication=3.0.19

pkgname=crow-translate
pkgver=2.3.2
pkgrel=3
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
sha256sums=(4dbaffbc9c9e78e0920695ff21115cf99c5bc7b1afa693bb6b7d364dcc856610
            20cc2736f6dec3a376b6746525076de2760e997085fb3d3f2776f0ce5b676182
            d21867b4f15a67c03d26c960da864a63368ccdf7da2dfaa545c135aad506085e
            85039ca8ff899ed724ed16b719be7a814392a67ad53b4b59f160f73fb53dc74c
            9405fd259288b2a862e91e5135bccee936f0438e1b32c13603277132309d15e0)

# Move submodules into the project
prepare() {
    mv QOnlineTranslator-$_qonlinetranslator/* $pkgname-$pkgver/src/qonlinetranslator
    mv QHotkey-$_qhotkey/* $pkgname-$pkgver/src/third-party/qhotkey
    mv QTaskbarControl-$_qtaskbarcontrol/* $pkgname-$pkgver/src/third-party/qtaskbarcontrol
    mv SingleApplication-$_singleapplication/* $pkgname-$pkgver/src/third-party/singleapplication
}

build() {
    cd $pkgname-$pkgver
    qmake
    make
}

package() {
    cd $pkgname-$pkgver
    make INSTALL_ROOT="$pkgdir/" install
} 
