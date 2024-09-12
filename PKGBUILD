# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-dsl-bin
_pkgname=${pkgname%-bin}
epoch=2
pkgver=4.33
pkgrel=1
_release=2024-09/R
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

sha512sums_x86_64=('518f29b1f1415e73f0b02569bc800db69bec006373afd4a701723937543c46ceda1f1d4dd5bb9a198cedb56200f76cf2defde8c577cd0e7a23dcc1da5ccc8be7')
sha512sums_aarch64=('1e52fe6d4569363a8dcbad9df4d0a943085973e8f61d979c56e953982e596338acf1245da77f182ffc35b5d4efe945214b4b9704483d742ac4352dcf055c2d6b')

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
