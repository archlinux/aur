# Maintainer: Timo Kramer <dump-aur at timokramer dot de>

_appname=poly
pkgname=polylith-bin
pkgver=0.2.17_alpha
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
sha256sums=('bb99336eb0a5604e6639c8a0184d7bf0daa6aa5443ec7ff478a7696dae2063f8'
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
