# Maintainer: veluria <veluria ät anche.no>

pkgname="launch4j"
pkgver="3.8"
pkgrel="1"
arch=('i686' 'x86_64')
license=('custom')
pkgdesc="Cross-platform Java executable wrapper"
url="http://launch4j.sf.net"
depends=('java-runtime' 'glibc')
# for 64bit
[ "$CARCH" = "x86_64" ] && depends[1]='lib32-glibc'
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-linux.tgz")
sha256sums=('e0cb0240c91b3ed6ca7bb85743fd09d6d7651cc3671a5fc17f67e57b8f7a80c6')
options=('!strip' 'staticlibs')

package()
{
  mkdir -p ${pkgdir}/opt
  cp -aR ${srcdir}/launch4j ${pkgdir}/opt/
  chmod -R 755 ${pkgdir}/opt/launch4j
  mkdir -p ${pkgdir}/usr
  mkdir -p ${pkgdir}/usr/bin

  cat > launch4j.desktop << EoF
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Categories=Java;Development;
Name=launch4j
Comment=Cross-platform Java executable wrapper
Path=/opt/launch4j
Exec=/opt/launch4j/launch4j
Icon=/opt/launch4j/src/images/build.png
Terminal=false

EoF

  install -D -m 644 $srcdir/launch4j.desktop $pkgdir/usr/share/applications/launch4j.desktop
}
