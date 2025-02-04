pkgname="launch4j"
pkgver="3.50"
pkgrel="2"
arch=('x86_64')
license=('custom')
pkgdesc="Cross-platform Java executable wrapper"
url="http://launch4j.sf.net"
depends=('java-runtime' 'glibc')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-linux-x64.tgz")
sha256sums=('a6ad95c2fb6300410543288308b4eeae72ecd1df033928dfc524ba539bbc4d36')
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

  cat > launch4j.sh << 'EoF'
#!/bin/bash
/opt/launch4j/launch4j "$@"

EoF

  install -D -m 644 $srcdir/launch4j.desktop $pkgdir/usr/share/applications/launch4j.desktop
  install -D -m 755 $srcdir/launch4j.sh $pkgdir/usr/bin/launch4j

  sed -i.bak 's/\r$//' $pkgdir/opt/launch4j/launch4j
  rm $pkgdir/opt/launch4j/launch4j.bak
}
