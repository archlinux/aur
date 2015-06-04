# Maintainer: portals <portals at riseup.net> Base on work of: 2bluesc <2bluesc at gmail.com> and mazzolino <maze+aur at strahlungsfrei.de>
# Contributor: Pieter Kokx <pieter@kokx.nl>

pkgname=armory
_pkgname=BitcoinArmory
pkgver=0.93.1 
_pkgver=0.93.1 
pkgrel=3
pkgdesc="Python-Based Bitcoin Software"
arch=('i686' 'x86_64')
url="https://github.com/etotheipi/BitcoinArmory"
license=('AGPL3')
groups=()
depends=('crypto++' 'swig' 'python2' 'twisted' 'qt4' 'python2-pyqt4' 'python2-bsddb' 'python2-psutil')
makedepends=('git' 'gcc' 'make')
provides=('armory')
conflicts=('armory' 'armory-git')
replaces=()
backup=()
options=()
optdepends=('bitcoin-daemon: Connect to BitCoin network')
install=
source=("run-armory.sh" "http://github.com/etotheipi/BitcoinArmory/archive/v$_pkgver.tar.gz" 
"armory.desktop")
sha256sums=('baa1d335273af1f1f4d12dd68f066035e5b4485b215172690c307877ac62168c' '39f07b3a8bddd3ed6259b730b9ca87a7756ef5f52edb14bff868a57c90aaa8d3'
'9625e81c0d914176689ce40779e5b49376dc85efb84827ef4b006920d5726680')

build() {
    cd $srcdir/BitcoinArmory-$_pkgver/

    make PYVER=python2.7
}

package() {
  install -Dm 755 "$srcdir/run-armory.sh" "$pkgdir/usr/bin/armory"
  install -Dm 644 "$srcdir/armory.desktop" "$pkgdir/usr/share/applications/armory.desktop"
  mkdir -p "$pkgdir/opt"
  cp -R "$srcdir/$_pkgname-$_pkgver/" "$pkgdir/opt/"
  mv "$pkgdir/opt/$_pkgname-$_pkgver" "$pkgdir/opt/$_pkgname"

  rm -rf "$pkgdir/opt/$_pkgname/cppForSwig/"
  rm -rf "$pkgdir/opt/$_pkgname/.git/"
  rm -rf "$pkgdir/opt/$_pkgname/.gitignore"
}
