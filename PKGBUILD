# Maintainer: Shatur95 <genaloner@gmail.com>

pkgname=crow-translate
pkgver=1.0.2
pkgrel=2
pkgdesc="A simple and lightweight translator that allows to translate and say selected text using the Google Translate API and much more"
arch=('x86_64')
url="https://github.com/Shatur95/crow-translate"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools')
source=($pkgname.tar.gz::"https://github.com/Shatur95/crow-translate/archive/$pkgver.tar.gz"
        QOnlineTranslator-submodule.tar.gz::"https://github.com/Shatur95/QOnlineTranslator/archive/0.9.0.tar.gz"
        QGitRelease-submodule.tar.gz::"https://github.com/Shatur95/QGitRelease/archive/1.0.0.tar.gz"
        QHotkey-submodule.tar.gz::"https://github.com/Skycoder42/QHotkey/archive/1.2.2.tar.gz"
        SingleApplication-submodule.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/v3.0.10.tar.gz")
sha256sums=('7753d855453823da6cb5d7122e8fcd3ef0097343036ffbf8f1f734982f848b32'
            '8fbdb91ac1d8f3e103de44ab41f65b687d735aa21519082be7f48e3ce7ba4ebc'
            'cf45aed712bccc94f13f065cf0ce77a48b3b50bdc95671ddcfd7c1d714a069e8'
            '1a5a6eb81738a8f232df2dd5c908839871077e10ca3b9a6437daf5fda53d86ad'
            '9c8ae7431ea008c4516456615558c433940d3d0a144dc549f5aac43193b4afc0')

# Move submodules into the project
prepare() {
    mv QOnlineTranslator-0.9.0/* "$pkgname-$pkgver/src/qonlinetranslator"
    mv QGitRelease-1.0.0/* "$pkgname-$pkgver/src/qgitrelease"
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
