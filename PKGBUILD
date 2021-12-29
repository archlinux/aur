# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: thgier <https://github.com/thgier>

_name=PotatoPresenter
pkgname=potatopresenter
pkgver=1.0.0
pkgrel=2
pkgdesc="Tool to create presentation slides that can be exported as PDF."
arch=('x86_64')
url="https://github.com/thgier/PotatoPresenter"
license=('LGPL2.1')
depends=('ktexteditor' 'antlr4-runtime')
makedepends=('cmake')
optdepends=('texlive-latexextra: for LaTeX formular support'
            'texlive-fontsextra: for LaTeX formular support'
            'texlive-science: for LaTeX formular support')
provides=('potatopresenter')
conflicts=('potatopresenter')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/thgier/PotatoPresenter/master/potato_logo.svg"
        "potatopresenter.desktop")
sha256sums=('f764d6b0efb8967d5b57d6616c759d8a43acc45cd1e1d92b542a4124480dc395'
            'd96b384a4e8ba5365785f9be8cd77e2f54d0ae767de7ae4c2f2f52c9de0e083b'
            '030597070eefe827d1895f3736cf2c70753e2ca13812350610122193976a2a7c')

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

