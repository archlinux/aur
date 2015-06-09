# Maintainer: Alexander Konarev  <avkonarev@gmail.com>
# Author: Andrey Ovsankin aka EvilBeaver
pkgname=onescript
pkgver=1.0.9
pkgrel=1
pkgdesc="This project is an alternative implementation of the virtual machine, execute scripts in the language of the 1C:Enterprise"
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="https://bitbucket.org/EvilBeaver/1script"
depends=('mono')
makedepens=('unzip')

source=(
        "https://bitbucket.org/EvilBeaver/1script/downloads/OneScript-$pkgver-bin.zip"
        "https://bitbucket.org/EvilBeaver/1script/wiki/attachments/snake.os"
        "oscript"
        )
noextract=("OneScript-$pkgver-bin.zip")

md5sums=('c4a3a16290c4ee594b1b6114cec3d3ba'
         'e88df2f8a75ee97859839b3f45fe7e0a'
         'd0c25bfc717401e9806a7612581f6995')

prepare() {
  cd $srcdir
  unzip OneScript-$pkgver-bin.zip -d OneScript-$pkgver
}

package() {
  cd $srcdir
  install -Dm755 oscript "$pkgdir/usr/bin/oscript"

  install -d "$pkgdir/usr/share/oscript/examples"
  install -Dm644 snake.os "$pkgdir/usr/share/oscript/examples"

  cd $srcdir/OneScript-$pkgver/
  install -d "$pkgdir/usr/lib/oscript"
  install -Dm644 * "$pkgdir/usr/lib/oscript"
}
