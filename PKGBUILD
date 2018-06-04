# Maintainer: Shatur95 <genaloner@gmail.com>

pkgname=crow-translate
pkgver=0.9.9
pkgrel=1
pkgdesc="A simple and lightweight translator that allows to translate and speak the selected text using the Google Translate API"
arch=('x86_64')
url="https://github.com/Shatur95/Crow-Translate"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools')
source=(Crow-Translate.tar.gz::"https://github.com/Shatur95/Crow-Translate/archive/$pkgver.tar.gz"
        QOnlineTranslator-submodule.tar.gz::"https://github.com/Shatur95/QOnlineTranslator/archive/0.8.0.tar.gz"
        QHotkey-submodule.tar.gz::"https://github.com/Skycoder42/QHotkey/archive/1.2.2.tar.gz"
        SingleApplication-submodule.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/v3.0.10.tar.gz")
sha256sums=('8a6ccdcc0bda941420be24d3322936117a982771e3686c18494a8da4eed9ecb0'
            '2accf32e3335061c524cc15be8c0dea2f7ea8df5c191a40e6aeffa3641dbde0e'
            '1a5a6eb81738a8f232df2dd5c908839871077e10ca3b9a6437daf5fda53d86ad'
            '9c8ae7431ea008c4516456615558c433940d3d0a144dc549f5aac43193b4afc0')

# Move the submodules into the project
prepare() {
    mv QOnlineTranslator-0.8.0/* Crow-Translate-$pkgver/src/qonlinetranslator
    mv QHotkey-1.2.2/* Crow-Translate-$pkgver/src/third-party/qhotkey
    mv SingleApplication-3.0.10/* Crow-Translate-$pkgver/src/third-party/singleapplication
}

build() {
    cd Crow-Translate-$pkgver
    qmake
    make
}

package() {
    cd Crow-Translate-$pkgver
    make INSTALL_ROOT="$pkgdir/" install
} 
