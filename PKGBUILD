# Maintainer: Alexander Konarev (avkonarev) <AVKonarev@gmail.com>

pkgname=dmusic
pkgver=0.3
pkgrel=6
pkgdesc="Compact and native Yandex Music client"
arch=('i686' 'x86_64')
url="https://github.com/levovix0/DMusic"
license=('GPL3')
arch=('x86_64')
source=("https://github.com/levovix0/DMusic/archive/refs/tags/$pkgver.zip"
        "DMusic.desktop")
sha256sums=('1f82e732584257246162201bc59b339adca71a90dcd811b775a6b681f067d7f2'
            '5aa2b3210f93963c825373195aae8adaa75edf9c82c59d657c0c3250a37c3a8a')
depends=(
  'taglib' 
  'qt5-base' 
  'qt5-declarative' 
  'qt5-multimedia'  
  'qt5-quickcontrols' 
  'qt5-quickcontrols2' 
  'qt5-svg'
  'openssl-1.1')

makedepends=('nim')

prepare(){
  cd $srcdir/DMusic-$pkgver
  [ -d build ] || mkdir build
}

build(){
  cd $srcdir/DMusic-$pkgver
  nimble build -yd:release
}

package() {
    cd $srcdir/DMusic-$pkgver
    install -dm755 $pkgdir/usr/bin
    install -Dm755 dmusic $pkgdir/usr/bin/

    install -dm755 $pkgdir/usr/share/DMusic
    install -Dm755 {resources/app.svg,LICENSE} $pkgdir/usr/share/DMusic
    
    install -dm755  $pkgdir/usr/share/applications
    install -Dm755 ../DMusic.desktop $pkgdir/usr/share/applications
}
