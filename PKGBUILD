# Maintainer: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
pkgname=git-town
pkgver=0.6.63.gde450dd15e07
pkgrel=1
pkgdesc="A git extension for generic high-level git workflow support"
url="https://github.com/Originate/git-town"
arch=('x86_64' 'i686')
license=('MIT')
depends=('bash' 'git' 'dialog')
source=("$pkgname"::'git://github.com/Originate/git-town#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
      git describe --tags --abbrev=12 | sed -e 's:v::' -e 's/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/lib/git-town
  chmod 755 $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin
  cp -r src/* $pkgdir/usr/lib/git-town
  cd src
  
  for comm in *
  do
      if [ -f $comm ]
      then
          echo "#!/bin/bash
/usr/lib/git-town/$comm" > $pkgdir/usr/bin/$comm
          chmod 755 $pkgdir/usr/bin/$comm
      fi
  done
  
  cd ..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p $pkgdir/usr/share/man/man1
  cp -r man $pkgdir/usr/share/
}

