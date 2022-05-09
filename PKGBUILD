# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: thgier <https://github.com/thgier>

_name=PotatoPresenter
pkgname=potatopresenter
pkgver=1.0.2
pkgrel=1
pkgdesc="Tool to create presentation slides that can be exported as PDF."
arch=('x86_64')
url="https://github.com/thgier/PotatoPresenter"
license=('LGPL2.1')
depends=('ktexteditor' 'antlr4-runtime')
makedepends=('cmake' 'antlr4')
optdepends=('texlive-latexextra: for LaTeX formular support'
            'texlive-fontsextra: for LaTeX formular support'
            'texlive-science: for LaTeX formular support')
provides=('potatopresenter')
conflicts=('potatopresenter')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/thgier/PotatoPresenter/master/potato_logo.svg"
        "potatopresenter.desktop")
sha256sums=('65b954265ac4f364566ebbaf5e41e25509d57b5eb18153d33d1b5b122787308c'
            'd96b384a4e8ba5365785f9be8cd77e2f54d0ae767de7ae4c2f2f52c9de0e083b'
            '030597070eefe827d1895f3736cf2c70753e2ca13812350610122193976a2a7c')

prepare() {
  cd $_name-$pkgver/src/antlr/markdown/
  ./generate.sh
  cd ../potato/
  ./generate.sh
}

build() {  
  cmake -B build -S $_name-$pkgver
  cmake --build build
}

package() {
  # binary
  install -Dm755 "build/praes" "$pkgdir/usr/bin/$pkgname"

  # application file
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 "potato_logo.svg" "$pkgdir/usr/share/${pkgname}/logo.svg"
}

