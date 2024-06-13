# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>
# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=eclipse-java
epoch=2
pkgver=4.32
pkgrel=1
_release=2024-06/R
pkgdesc="Highly extensible IDE (Java version)"
arch=('x86_64' 'aarch64')
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-environment>=21'
         'unzip'
         'webkit2gtk')
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)
options=(!strip)

_srcfilename_x86_64="$pkgname-${_release//\//-}-linux-gtk-x86_64.tar.gz"
_srcfilename_aarch64="$pkgname-${_release//\//-}-linux-gtk-aarch64.tar.gz"

source_x86_64=("$_srcfilename_x86_64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_x86_64&r=1")
source_aarch64=("$_srcfilename_aarch64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_aarch64&r=1")

sha512sums_x86_64=('bdf4b41131494f9478c23c1ba21cf00345c819c76bbfda2d32a8e4bcdac3763b1f262c2f864c629f2213bd59199df868c490f630cb84e6db21763e4ab9ce35db')
sha512sums_aarch64=('8544055a3b806798e435038e7f63588782512a70d73f278453e839e0f47aef442f7112741bc26c801870e09f578f23c5a64633a8866578668a33fb7bac158926')

source=("eclipse.desktop")
sha512sums=('676d79e18ef847fc27efc68d85e5f3c3af3eaaa9946acc98161998a3a0771d2a72c7197bdb6d8c180e1b59c2a0bb591150d15114b416c1a0a0f5dbdb06bdb13e')

#backup=('usr/lib/eclipse/eclipse.ini')

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"
  chmod 755 "${pkgdir}/usr/bin/eclipse"

  install -Dm0644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"

  for i in 16 22 24 32 48 64 128 256 512 1024 ; do
      install -Dm0644 eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse$i.png \
          "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
  done
}
