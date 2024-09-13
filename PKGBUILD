# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=logstash-bin
pkgver=8.15.1
pkgrel=1
pkgdesc="Transport and process your logs, events, or other data"
arch=('x86_64')
url="https://github.com/elastic/logstash"
license=('Apache-2.0 OR Elastic-2.0')
depends=('java-runtime' 'ruby' 'ruby-bundler' 'coreutils' 'awk')
backup=('etc/logstash/jvm.options'
        'etc/logstash/log4j2.properties'
        'etc/logstash/logstash.yml'
        'etc/logstash/pipelines.yml')
options=(!debug)
source=("https://artifacts.elastic.co/downloads/logstash/logstash-${pkgver}-linux-x86_64.tar.gz"
        "logstash.service"
        "logstash.sysusers"
        "logstash.tmpfiles")
sha512sums=('ffa68eb55f065d32550e2f211afedd92d29b9a8f9be5ade1028362dfcbf5f6b207b21927d65641cda29eff2782f01a79eb67bde012df134969b64f646cc8bb8c'
            '5a50aacd9e1186c4535726d5baf7481133c348286dde83f9c9e9bfab7c3db960a1009165203a5eefd557c83a988571ffbf4e6c8758cbc8c4034c8cb419d04026'
            'd811dc3b18d0032b79b4669c9f6aefca49963897c309d83cbf87616c7b8cb5944c17c8072980bcd115d0fb57ef1624d98259ff1082d402d308c33e766ee89699'
            '05ea8af97c4f6ac9ba5518b99dc3136859edd24d8376940b48b8c7a70586c8bc188deb1079a99e19d437c39e0eb17d68e7cc3f9af4aa3ad2bc6a87c08cae94a6')

package() {
  cd logstash-${pkgver}
  install -dm 755 "${pkgdir}/usr/share/logstash" "${pkgdir}/etc/logstash"
  mv config/* "${pkgdir}/etc/logstash/"
  cp -a * "${pkgdir}/usr/share/logstash"
  install -Dm 644 "${srcdir}/logstash.service" "${pkgdir}/usr/lib/systemd/system/logstash.service"
  install -Dm 644 "${srcdir}/logstash.sysusers" "${pkgdir}/usr/lib/sysusers.d/logstash.conf"
  install -Dm 644 "${srcdir}/logstash.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/logstash.conf"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/logstash/bin/logstash "${pkgdir}/usr/bin/logstash"
}
