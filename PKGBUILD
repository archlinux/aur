# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=apache-gremlin-console
pkgver=3.6.3
pkgrel=1
pkgdesc="Gremlin console from Apache TinkerPop "
arch=('any')
url="https://tinkerpop.apache.org"
license=('Apache')

depends=('bash' 'java-environment')
makedepends=()
source=(https://www.apache.org/dist/tinkerpop/${pkgver}/apache-tinkerpop-gremlin-console-${pkgver}-bin.zip)
sha256sums=('fcd39ae0fdd0f5f4ca73231cd1c306b1bfd6ed15742af88f5b38094e9f1f52e8')

package() {
  cd apache-tinkerpop-gremlin-console-${pkgver}

  mkdir -p "${pkgdir}/usr/share/${pkgname}/bin"
  cp bin/gremlin.sh "${pkgdir}/usr/share/${pkgname}/bin"
  
  for i in conf data ext lib ; do
    cp -R "$i" "${pkgdir}/usr/share/${pkgname}"
  done

  mkdir -p "${pkgdir}/usr/bin"
  printf "#!/bin/sh\ncd /usr/share/${pkgname}/bin\n./gremlin.sh \"\$@\"" > "${pkgdir}/usr/bin/gremlin"
  chmod 755 "${pkgdir}/usr/bin/gremlin"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
