# Maintainer: Alexander Konarev (avkonarev) <AVKonarev@gmail.com>

pkgname=dmusic
pkgver=0.3
pkgrel=1
pkgdesc="Compact and native Yandex Music client"
arch=('i686' 'x86_64')
url="https://github.com/levovix0/DMusic"
license=('GPL3')
arch=('x86_64')
source=("https://github.com/levovix0/DMusic/archive/refs/tags/$pkgver.zip"
        "DMusic.desktop")
sha256sums=('1f82e732584257246162201bc59b339adca71a90dcd811b775a6b681f067d7f2'
            '5aa2b3210f93963c825373195aae8adaa75edf9c82c59d657c0c3250a37c3a8a')
depends=('taglib' 'qt6-base' 'qt6-declarative' 'qt6-quick3d' 'qt6-quicktimeline' 
    'qt6-svg' 'qt6-webchannel' 'qt6-webengine')
makedepends=('nim')
#options=('!strip')

build(){
  cd $srcdir/DMusic-$pkgver
  nimble build -d:release
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
