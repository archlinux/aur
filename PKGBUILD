# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-dsl-bin
_pkgname=${pkgname%-bin}
epoch=2
pkgver=4.34
pkgrel=1
_release=2024-12/R
pkgdesc="Highly extensible IDE (Java and DSL version)"
arch=('x86_64' 'aarch64')
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-runtime>=21' webkit2gtk unzip)
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)
options=(!strip)

_srcfilename_x86_64="$_pkgname-${_release//\//-}-linux-gtk-x86_64.tar.gz"
_srcfilename_aarch64="$_pkgname-${_release//\//-}-linux-gtk-aarch64.tar.gz"

source_x86_64=("$_srcfilename_x86_64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_x86_64&r=1")
source_aarch64=("$_srcfilename_aarch64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_aarch64&r=1")

sha512sums_x86_64=('b3113e7b25ed362278ab04cd1bd3d6b33fbaf1a9394b9eaa659cc5da8d5a838bcdcbf68e5342b3befadb9dc5acd1641b65212f5f76b59ea6dae7313bd4cefcc7')
sha512sums_aarch64=('d4a40a996f673e5020ef2bdb1385f5d88cbcc3177a9215c60ebef6c959a8205c18c8caf249db0c70395a4c221b54e8186d402ff9ee659b618b154aaa69d43629')

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
