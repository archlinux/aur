# Maintainer: Timo Kramer <dump-aur at timokramer dot de>

_appname=poly
pkgname=polylith-bin
pkgver=0.2.21
pkgrel=1
pkgdesc="An open source tool used to develop Polylith based architectures in Clojure"
arch=(any)
url='https://github.com/polyfy/polylith'
license=(EPL)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('java-runtime' 'git')
optdepends=('clojure: Lisp dialect for the JVM')
source=("${url}/releases/download/v${pkgver//_/-}/${_appname}-${pkgver//_/-}.tar.gz"
        'poly.sh')
sha256sums=('8cf74e5a9e9d639911477fd6cc77393e80dca52f4d0f209425259ba408280e4e'
            'ca3e71533f73d85a4bd00e8afcae08b8989e1774b1e4336f387e428f69ee1093')
options=(!strip)

package() {
  cd "${srcdir}/${_appname}"
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -D -m644 poly*.jar "${pkgdir}/usr/share/java/${pkgname}/poly.jar"
  install -D -m755 "${srcdir}/poly.sh" "${pkgdir}/usr/share/java/${pkgname}/poly.sh"
  ln -sf "/usr/share/java/${pkgname}/poly.sh" "${pkgdir}/usr/bin/poly"
}
