# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=apache-gremlin-console
pkgver=3.7.3
pkgrel=2
pkgdesc="Gremlin console from Apache TinkerPop "
arch=('any')
url="https://tinkerpop.apache.org"
license=('Apache-2.0')

depends=('bash' 'java-environment')
makedepends=()
source=(https://www.apache.org/dist/tinkerpop/${pkgver}/apache-tinkerpop-gremlin-console-${pkgver}-bin.zip)
sha256sums=('8499a07d0245909e5471ec593783e03c844e58c74977f8bd2023a5273d1c9d21')

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
