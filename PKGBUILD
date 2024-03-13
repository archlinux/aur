# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>
# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=eclipse-dsl
epoch=2
pkgver=4.31
pkgrel=1
_release=2024-03/R
pkgdesc="Highly extensible IDE (Java and DSL version)"
arch=('x86_64' 'aarch64')
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-runtime>=17' webkit2gtk unzip)
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)

_srcfilename_x86_64="$pkgname-${_release//\//-}-linux-gtk-x86_64.tar.gz"
_srcfilename_aarch64="$pkgname-${_release//\//-}-linux-gtk-aarch64.tar.gz"

source_x86_64=("$_srcfilename_x86_64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_x86_64&r=1")
source_aarch64=("$_srcfilename_aarch64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_aarch64&r=1")

sha512sums_x86_64=('687028f9e094566104664eed663131e879a0c1eb2dfcc84e9e373cd4ae41ed2a4b90fe9f45bef2c1b457d98afed6f3c066323fa110ae5a8fd8c213a7e7151d79')
sha512sums_aarch64=('ec6fe1ff12e5ea08e33f8daa7c16d87990aab076717487320950dcd9f2b3ca243b603d3c136bea82c16b5e0961df3ce0b5023e9f778937d5e0b25779ada68022')

source=("eclipse.desktop")
sha512sums=('542a20e13e7f486c55bfc8e22a9da6f4100125809de6b0a2ecdd95e2ca6a242d4dd02d0eeec328c3a7a96bb4a31d2c0e2c7a8cbdfae7f606c46b8029523f8da2')

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
