# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=droid64
_pkgname=droiD64
pkgver=0.17b
pkgrel=1
pkgdesc='A graphical filemanager for D64 files (Commodore 64 and others)'
arch=(any)
url=http://droid64.sourceforge.net
license=('GPL2')
depends=('java-runtime')
optdepends=('vice')
noextract=(${pkgname}-${pkgver}.jar)
source=(
  https://sourceforge.net/projects/${pkgname}/files/${_pkgname}/${pkgver}/${pkgname}-${pkgver}.jar
	http://${pkgname}.sourceforge.net/data/${_pkgname}_icons.tar.gz
)
sha256sums=(
  e6489b73e72c78540be625eca62bbe6afeef262d9f931920308b91696cc09761
  2f1315b3ea0b3f3ee3b605e16e3f0dc5c29a043a2e03477cefad085927f8fe90
)

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cat > ${pkgdir}/usr/bin/${pkgname} << EOF
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar' "\$@"
EOF
  chmod +x ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
  install -Dm644 ${srcdir}/${_pkgname}_icons/${_pkgname}_Icon.xpm ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
  install -Dm644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
