# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>
# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=eclipse-java-bin
_pkgname=${pkgname%-bin}
epoch=2
pkgver=4.34
pkgrel=1
_release=2024-12/R
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

_srcfilename_x86_64="$_pkgname-${_release//\//-}-linux-gtk-x86_64.tar.gz"
_srcfilename_aarch64="$_pkgname-${_release//\//-}-linux-gtk-aarch64.tar.gz"

source_x86_64=("$_srcfilename_x86_64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_x86_64&r=1")
source_aarch64=("$_srcfilename_aarch64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_aarch64&r=1")

sha512sums_x86_64=('dae3fdace259f237afaadad98ac3c16bf571eb7e2704200e5159de9a6bde594c4112e983dd0eac3c35c0fd5325f1cf9d798e2fd511a5059fc02ceca71391927c')
sha512sums_aarch64=('03f0cd430c106995396acd4cb9a59037174bab75eee0089521b4872281b837c1ed5e6975d8e942ff96419ef4c87158fd4f0936f7dac2d6229197c4c79ef337f1')

source=("eclipse.desktop")
sha512sums=('676d79e18ef847fc27efc68d85e5f3c3af3eaaa9946acc98161998a3a0771d2a72c7197bdb6d8c180e1b59c2a0bb591150d15114b416c1a0a0f5dbdb06bdb13e')

#backup=('usr/lib/eclipse/eclipse.ini')

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"

  install -Dm0644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"

  for i in 16 22 24 32 48 64 128 256 512 1024 ; do
      install -Dm0644 eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse$i.png \
          "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
  done
}
