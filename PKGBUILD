# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tuprolog-bin
_pkgname=tuprolog
pkgver=4.0.3
pkgrel=1
pkgdesc='A light-weight Prolog system for distributed applications and infrastructures.'
arch=('any')
url='http://apice.unibo.it/xwiki/bin/view/Tuprolog/'
license=('LGPL')
provides=('tuprolog')
depends=('java-runtime')
makedepends=('gendesk')
source=("https://gitlab.com/pika-lab/tuprolog/2p/wikis/uploads/87b96d15ce4a1c42ac9825883fd3cfdd/2p-4.0.3.jar")
noextract=('2p-4.0.3.jar')
sha512sums=('d059408604bbe4e7826ee62ed136ef3545d94307e08905c2839968ab5b06d1f09ad5a1948e7177164ac8ff5b9c76e4b399c3999ba4a55323f6e860db7673d9ba')

package() {
  echo "#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/tuprolog/2p.jar' \"\$\@\"" > "2p"
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec=2p \
   --categories=Education\;Science\;Java --icon "${_pkgname}"
  install -Dm755 2p-${pkgver}.jar "${pkgdir}/usr/share/java/tuprolog/2p.jar"
  install -Dm755 2p "$pkgdir/usr/bin/2p"
  install -Dm644 tuprolog.desktop "$pkgdir/usr/share/applications/2p.desktop"
}