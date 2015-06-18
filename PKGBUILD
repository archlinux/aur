# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=dirbuster
_pkgname=DirBuster
pkgver=1.0_RC1
pkgrel=10
pkgdesc="An application designed to brute force directories and files names on web/application servers"
url='http://www.owasp.org/index.php/Category:OWASP_DirBuster_Project'
license=('LGPL')
arch=('any')
depends=('java-runtime' 'sh')
source=("https://downloads.sourceforge.net/dirbuster/${_pkgname}-${pkgver/_/-}.tar.bz2")
sha512sums=('0462b14d5bd58ef8ebd4e3b26c8c72f838bb8241de23544f548f4f55bf8bccf23b49dc05eb7c23e15dc601ccc267f71bb93c43b66f0f7a89a834433b35ba1c1f')

prepare() {
  cd ${_pkgname}-${pkgver/_/-}
 
  cat > "${pkgname}" <<EOF
#!/bin/sh
exec java -jar /usr/lib/${pkgname}/DirBuster-${pkgver/_/-}.jar "\$@"
EOF
  chmod +x "${pkgname}"
}

package() {
  cd ${_pkgname}-${pkgver/_/-}

  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r *.jbrofuzz *.txt "${pkgdir}/usr/share/${pkgname}"

  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r lib *.jar "${pkgdir}/usr/lib/${pkgname}"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
} 

# vim: ts=2 sw=2 et:
