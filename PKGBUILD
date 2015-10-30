# Maintainer: William Grieshaber <me@zee.li>
# Contributor: portals <portals at riseup.net> Base on work of: 2bluesc <2bluesc at gmail.com> and mazzolino <maze+aur at strahlungsfrei.de>
# Contributor: Pieter Kokx <pieter@kokx.nl>

pkgname=armory
_pkgname=BitcoinArmory
pkgver=0.93.3 
_pkgver=0.93.3
pkgrel=1
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
sha512sums=('385a035f4b24559f199b5ab59d16a94285c5a486129c1493a445b6d266c9dff85253bef439c4d615e1b3326f5224bda84b47dc9bb2b355125d9fd1ac4a1a49c9'
            '706c61b569ec703bf2f2c25351fca3923793219fedeca3ac0945d106ba1d6e74b02bacd633e2184c9f71445b8a76697f1bbcb11c29407e24ac4445461da1a7c1'
            '95801e8d471225e45b3c77e11cb002fd433254914c64120ca9222f9bcb9d8dbef1f10f3cd6e41015a8f0541cd2b3453627a1865216e84f5848698bf5c31ed70a')

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
