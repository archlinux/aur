# Maintainer: Paul Bastian <paul.bastian@posteo.de>
pkgname=librespot-java
pkgver=1.6.3
pkgrel=1
pkgdesc="A Spotify Connect enabled headless client"
arch=('any')
url="https://github.com/librespot-org/librespot-java"
license=('APACHE')
depends=('java-runtime')
conflicts=('librespot-java-git')
backup=(etc/librespot-java/config.toml)
source=("https://github.com/librespot-org/librespot-java/releases/download/v$pkgver/librespot-player-$pkgver.jar"
        "https://raw.githubusercontent.com/paulbastian/aur/master/librespot-java/config.toml"
        "https://raw.githubusercontent.com/paulbastian/aur/master/librespot-java/librespot-java.service"
        "https://raw.githubusercontent.com/paulbastian/aur/master/librespot-java/librespot-java-restart.service"
        "https://raw.githubusercontent.com/paulbastian/aur/master/librespot-java/librespot-java-restart.timer")
noextract=("librespot-player-$pkgver.jar")
sha256sums=('543d002d2cfe153be0aea732b0d29e0fe6aa7a768cd1f3f070a766e201eb1a20'
            '732a44a47780420484fdddff0c2ec206f58af3b4eddd71aa871e5b755890e3ee'
            '4d0b3452768be2eb380f6ae49c5d7fdfb0a095f699f71ce2a1697260b0c89b3a'
            'b1d29eed6e653ea37cc8d2d8c685ab0b12f646cfd12cf2d2d4a631442e3614bf'
            '538f3c76c3882c1ed20ce7185ab721cf25b2c2ae187c20fae72f2f5afa0bd024')

package() {	
  cd "$srcdir"

  mkdir -p "${pkgdir}"/usr/share/java/librespot
  install -D -m644 librespot-player-$pkgver.jar "$pkgdir/usr/share/java/librespot/librespot-player.jar" 
  
  mkdir -p "${pkgdir}"/etc/librespot-java
  install -m644 -Dt "$pkgdir/etc/librespot-java" config.toml

  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" librespot-java.service
  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" librespot-java-restart.service
  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" librespot-java-restart.timer
}
