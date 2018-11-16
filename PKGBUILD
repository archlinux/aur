# Maintainer: Shatur95 <genaloner@gmail.com>

pkgname=crow-translate
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple and lightweight translator that allows to translate and say selected text using the Google Translate API and much more"
arch=('x86_64')
url="https://github.com/Shatur95/crow-translate"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools')
source=($pkgname.tar.gz::"https://github.com/Shatur95/crow-translate/archive/$pkgver.tar.gz"
        QOnlineTranslator-submodule.tar.gz::"https://github.com/Shatur95/QOnlineTranslator/archive/0.9.1.tar.gz"
        QHotkey-submodule.tar.gz::"https://github.com/Skycoder42/QHotkey/archive/1.2.2.tar.gz"
        SingleApplication-submodule.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/v3.0.10.tar.gz")
sha256sums=('47f3b5d73ac93b19df93942afbc7d844dd7f19018326f2f110e1d3ea11a1acfb'
            '76fe991bd3689fe2299884959dcdb8d65d1a4669e2b8a6f2813cc05391e08aee'
            '1a5a6eb81738a8f232df2dd5c908839871077e10ca3b9a6437daf5fda53d86ad'
            '9c8ae7431ea008c4516456615558c433940d3d0a144dc549f5aac43193b4afc0')

# Move submodules into the project
prepare() {
    mv QOnlineTranslator-0.9.1/* "$pkgname-$pkgver/src/qonlinetranslator"
    mv QHotkey-1.2.2/* "$pkgname-$pkgver/src/third-party/qhotkey"
    mv SingleApplication-3.0.10/* "$pkgname-$pkgver/src/third-party/singleapplication"
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
