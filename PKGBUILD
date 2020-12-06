# Maintainer: Paul Bastian <paul.bastian@posteo.de>
pkgname=librespot-java
pkgver=1.5.2
pkgrel=1
pkgdesc="A Spotify Connect enabled headless client"
arch=('any')
url="https://github.com/librespot-org/librespot-java"
license=('APACHE')
depends=('java-runtime')
conflicts=('librespot-java-git')
backup=(etc/librespot-java/config.toml)
source=("https://github.com/librespot-org/librespot-java/releases/download/v$pkgver/librespot-api-$pkgver.jar"
        "https://github.com/librespot-org/librespot-java/releases/download/v$pkgver/librespot-player-$pkgver.jar"
        "https://github.com/paulbastian/aur/blob/master/librespot-java/config.toml"
        "https://github.com/paulbastian/aur/blob/master/librespot-java/librespot-java.service")
noextract=("librespot-api-$pkgver.jar"
           "librespot-player-$pkgver.jar")
sha256sums=('0097b97fd420ca0685ef409d03d133df580867317d37be9a4fff19ceb6dfe142'
            'ca0ea63d92dcfeb1b0834b960c644c2b55041f0439d468f1a7ad92928ac007e1'
            '732a44a47780420484fdddff0c2ec206f58af3b4eddd71aa871e5b755890e3ee'
            '6ce1a50046b5a81c308232afb0740d9579b817078e13285d06c40444f69f7169')

package() {	
  cd "$srcdir"

  mkdir -p "${pkgdir}"/usr/share/java/librespot
  install -m644 -Dt "$pkgdir/usr/share/java/librespot" librespot-api-$pkgver.jar 
  install -m644 -Dt "$pkgdir/usr/share/java/librespot" librespot-player-$pkgver.jar
  
  mkdir -p "${pkgdir}"/etc/librespot-java
  install -m644 -Dt "$pkgdir/etc/librespot-java" config.toml

  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" librespot-java.service
}
