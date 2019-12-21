# Maintainer: Shatur95 <genaloner@gmail.com>

# Submodule versions
_qonlinetranslator=1.2.2
_qhotkey=1.2.2
_qtaskbarcontrol=2.0.0
_singleapplication=3.0.18

pkgname=crow-translate
pkgver=2.3.0
pkgrel=2
pkgdesc="A simple and lightweight translator that allows to translate and say selected text using Google, Yandex and Bing translate API"
arch=('x86_64')
url="https://github.com/crow-translate/crow-translate"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'qt5-multimedia' 'qt5-x11extras' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/crow-translate/crow-translate/archive/$pkgver.tar.gz"
        QOnlineTranslator-$_qonlinetranslator.tar.gz::"https://github.com/Shatur95/QOnlineTranslator/archive/$_qonlinetranslator.tar.gz"
        QHotkey-$_qhotkey.tar.gz::"https://github.com/Skycoder42/QHotkey/archive/$_qhotkey.tar.gz"
        QTaskbarControl-$_qtaskbarcontrol.tar.gz::"https://github.com//Skycoder42/QTaskbarControl/archive/$_qtaskbarcontrol.tar.gz"
        SingleApplication-$_singleapplication.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/$_singleapplication.tar.gz")
sha256sums=('b258ec0893938e62e3c33163cfc6db7279c4a5691a30891c94613bce41989da3'
            '40df3af650048b651e4c624cf33f662deb392880107ad4e8cc4f4684e78042d5'
            '1a5a6eb81738a8f232df2dd5c908839871077e10ca3b9a6437daf5fda53d86ad'
            '85039ca8ff899ed724ed16b719be7a814392a67ad53b4b59f160f73fb53dc74c'
            '0f0ce6466dbfdadf2a7ea75aa1d461e2e279c8c03f747117c75bd376a46c6eec')

# Move submodules into the project
prepare() {
    mv QOnlineTranslator-$_qonlinetranslator/* "$pkgname-$pkgver/src/qonlinetranslator"
    mv QHotkey-$_qhotkey/* "$pkgname-$pkgver/src/third-party/qhotkey"
    mv QTaskbarControl-$_qtaskbarcontrol/* "$pkgname-$pkgver/src/third-party/qtaskbarcontrol"
    mv SingleApplication-$_singleapplication/* "$pkgname-$pkgver/src/third-party/singleapplication"
}

build() {
    cd "$pkgname-$pkgver"
    qmake
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
} 
