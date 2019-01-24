# Maintainer: Shatur95 <genaloner@gmail.com>

pkgname=crow-translate
pkgver=2.1.0
pkgrel=2
pkgdesc="A simple and lightweight translator that allows to translate and say selected text using Google, Yandex and Bing translate API"
arch=('x86_64')
url="https://github.com/Shatur95/crow-translate"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'qt5-multimedia' 'qt5-x11extras' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools')
source=($pkgname.tar.gz::"https://github.com/Shatur95/crow-translate/archive/$pkgver.tar.gz"
        QOnlineTranslator-submodule.tar.gz::"https://github.com/Shatur95/QOnlineTranslator/archive/1.1.2.tar.gz"
        QHotkey-submodule.tar.gz::"https://github.com/Skycoder42/QHotkey/archive/1.2.2.tar.gz"
        SingleApplication-submodule.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/3.0.13.tar.gz")
sha256sums=('6843798e013a31c829d3b1109d49712464126a40280488d17413c4513978d608'
            '0c4dacc125c4599c7dc04b74231266cf1610cb6b3f6447cd84cf743671c06017'
            '1a5a6eb81738a8f232df2dd5c908839871077e10ca3b9a6437daf5fda53d86ad'
            '72f7100344f16a2fb1a148eb3705185e2a64fed0d40d6c114e1ee35342841c76')

# Move submodules into the project
prepare() {
    mv QOnlineTranslator-1.1.2/* "$pkgname-$pkgver/src/qonlinetranslator"
    mv QHotkey-1.2.2/* "$pkgname-$pkgver/src/third-party/qhotkey"
    mv SingleApplication-3.0.13/* "$pkgname-$pkgver/src/third-party/singleapplication"
}

build() {
    cd "$pkgname-$pkgver"
    qmake
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
	warning "After switching from 1.0.x, need to delete application settings (just remove ~/.config/crow)"
} 
