# Maintainer: Federico Giuliani <federico.giuliani86@gmail.com>

pkgname=libresonic
pkgver=6.1
pkgrel=4
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Libresonic/libresonic/"
license=('GPL3')
depends=('java-runtime-headless')
conflicts=('subsonic' 'subsonic-kang' 'subsonic-kang-git' 'subsonic-beta')
backup=('var/lib/libresonic/db' 'var/lib/libresonic/libresonic.properties' 'var/lib/libresonic/libresonic.sh')
noextract=(libresonic-v${pkgver}.war libresonic-booter-jar-with-dependencies.jar)
install=$pkgname.install
source=(https://jenkins.undocumented.software/job/libresonic/lastSuccessfulBuild/artifact/libresonic-booter/target/libresonic-booter-jar-with-dependencies.jar
        https://github.com/Libresonic/libresonic/releases/download/v${pkgver}/libresonic-v${pkgver}.war
        'libresonic.sh'
        'libresonic.service')

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/lib/libresonic
  mkdir -p $pkgdir/var/playlists
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/etc/
  sed -i 's/LIBRESONIC_HOME=\/var\/libresonic/LIBRESONIC_HOME=\/var\/lib\/libresonic/' libresonic.sh
  mv libresonic-v${pkgver}.war libresonic.war
  cp  * $pkgdir/var/lib/libresonic
  ln -fs /var/lib/libresonic/libresonic.sh $pkgdir/etc/libresonic.conf
  cp $srcdir/libresonic.service $pkgdir/usr/lib/systemd/system
  chmod +x $pkgdir/var/lib/libresonic/libresonic.sh
}

sha256sums=('042ab6833a8fa351712ff34899d6c0ba0024e420f16f81661a17405df081f246'
            '34e4771f730f6de17aa2ba039cfab26772af3ab08e3f0c36d3f0c7a6e315a8e0'
            'f1f4a22efb411d1f31f834f9f229e81c39d7f4db720281d9b0862c2f1b4d0697'
            'afcef7b8ce8ceab58569440ed17d5828f39da072ea0d6e3e9fb82ac2feafcf9f')
