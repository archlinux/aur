# Maintainer: Ashwin Vishnu <ashwinvis+arch at pm D0T me>

pkgname=textidote-bin
_pkgname=textidote
pkgver=0.8.1
pkgrel=1
pkgdesc="Spelling, grammar and style checking on LaTeX documents"
arch=('any')
url="https://github.com/sylvainhalle/textidote"
license=('GPL')
provides=('textidote')
depends=('java-runtime-headless>=8')
source=(
  "https://github.com/sylvainhalle/textidote/releases/download/v${pkgver}/textidote_${pkgver}_all.deb"
  "textidote-desktop"
  "textidote.desktop")
sha256sums=('cc9574be321131949e44123a20a776de9e06eb3ac493ab573d4b381641ff0779'
            '4eb546045d0aa6e81a0b5bf54c98b321b9495d6e27688a13e6f92059443abe03'
            '0677dfb8fb17fcbb76a9dca354f8073cd5879e4e12c7f3f022fa758db9c1f961')

prepare() {
 cd "$srcdir"
 bsdtar xf data.tar.xz
 find -name "*~" -delete
 # Remove insecure RPATH
 # chrpath --delete "opt/estmob/sendanywhere/sendanywhere"
}

package() {
  # Create directories
  install -d "$pkgdir"/{etc/bash.completion.d,usr/bin,usr/share/{man/man1,applications},opt/$_pkgname}

  install -Dm644 etc/bash.completion.d/$_pkgname "$pkgdir"/etc/bash.completion.d/
  install -Dm755 usr/local/bin/$_pkgname "$pkgdir"/usr/bin/
  install -D opt/$_pkgname/$_pkgname.{jar,zsh} "$pkgdir"/opt/$_pkgname/
  install -D usr/share/man/man1/$_pkgname.1 "$pkgdir"/usr/share/man/man1/

  # Extra command to launch in browser
  install -Dm755 $_pkgname-desktop "${pkgdir}"/usr/bin/

  # Add it to desktop
  install -D $_pkgname.desktop "${pkgdir}"/usr/share/applications/
}
