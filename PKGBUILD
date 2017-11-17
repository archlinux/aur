# Maintainer: Victor A. Santos <victoraur.santos@gmil.com>

_pkgname=thesubberkt
pkgname=thesubberkt-git
pkgver=v0.1.1a.r3.gb193577
pkgrel=1
pkgdesc="thesubdb.com client for download subtiltes"
arch=('any')
url="https://gitlab.com/vaurelios/TheSubberKt"
license=('GPL')
depends=('java-runtime' 'java-openjfx')
makedepends=('java-environment' 'gradle')
source=('thesubberkt.sh'
        "$_pkgname::git+https://gitlab.com/vaurelios/TheSubberKt.git")
md5sums=('6d8c8fb0aea6e7413f1c941ef9d25e9e'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  gradle installDist
}

package() {
  cd "$srcdir/$_pkgname"
  
  install -Dm755 "../thesubberkt.sh" "$pkgdir/usr/bin/thesubberkt"
  install -Dm644 "data/thesubberkt.desktop" "$pkgdir/usr/share/applications/thesubberkt.desktop"
  
  cd "$srcdir/$_pkgname/build/install/thesubberkt/lib"

  for file in *.jar; do
    install -Dm644 "$file" "$pkgdir/usr/share/java/thesubberkt/$file"
  done
} 
