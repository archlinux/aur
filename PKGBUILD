# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>
# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=eclipse-java
epoch=2
pkgver=4.20
pkgrel=1
_release=2021-06/R
pkgdesc="Highly extensible IDE (Java version)"
arch=('x86_64')
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-environment>=11' webkit2gtk unzip)
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)

_srcfilename="$pkgname-${_release//\//-}-linux-gtk-$CARCH.tar.gz"
source=("$_srcfilename::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename&r=1"
        "eclipse.desktop")
sha512sums=('4047a3b89d577689ad5e78959d85843638d04145af4c24173d0567cbf7642d2e5faf4d919b8457203fedd68827b6ad3ddacfe1eba6cc997755b0ab5e05bd7179'
            '676d79e18ef847fc27efc68d85e5f3c3af3eaaa9946acc98161998a3a0771d2a72c7197bdb6d8c180e1b59c2a0bb591150d15114b416c1a0a0f5dbdb06bdb13e')

backup=('usr/lib/eclipse/eclipse.ini')

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"
  
  install -Dm0644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"
  
  for i in 16 22 24 32 48 64 128 256 512 1024 ; do
      install -Dm0644 eclipse/plugins/org.eclipse.platform_*/eclipse$i.png \
          "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
  done
}
