# Maintainer: Ning Sun <n@sunng.info>

pkgname=zipkin
pkgver=2.23.1
pkgrel=1
pkgdesc='Opensource Distributed Tracing System'
arch=('any')
url='http://zipkin.io'
license=('APACHE')
depends=('java-runtime>=8' 'bash')
optdepends=('kafka' 'cassandra')
install='zipkin.install'
source=(https://search.maven.org/remotecontent?filepath=io/zipkin/zipkin-server/${pkgver}/zipkin-server-${pkgver}-exec.jar
        'zipkin.sh'
        'zipkin.sysusers'
        'zipkin.service')
sha1sums=('ef2f578256182180d5f3c54a52e2fb5cd5f3ef8f'
          'SKIP'
          'SKIP'
          'SKIP')

package() {
  mkdir -p ${pkgdir}/{usr/bin,usr/share/java/zipkin}

  cp zipkin-server-${pkgver}-exec.jar ${pkgdir}/usr/share/java/zipkin/zipkin.jar

  install -Dm755 zipkin.sh ${pkgdir}/usr/bin/zipkin
  install -Dm644 ${srcdir}/zipkin.service ${pkgdir}/usr/lib/systemd/system/zipkin.service
  install -Dm644 "${srcdir}"/zipkin.sysusers "${pkgdir}"/usr/lib/sysusers.d/zipkin.conf
}
