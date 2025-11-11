# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=logstash-bin
pkgver=9.2.1
pkgrel=1
pkgdesc="Transport and process your logs, events, or other data"
arch=("x86_64")
url="https://github.com/elastic/logstash"
license=("Apache-2.0 OR Elastic-2.0")
depends=("java-runtime" "ruby" "ruby-bundler" "coreutils" "awk")
optdepends=("elasticsearch")
backup=("etc/logstash/jvm.options"
        "etc/logstash/log4j2.properties"
        "etc/logstash/logstash.yml"
        "etc/logstash/pipelines.yml")
options=("!debug")
source=("$pkgname-$pkgver.tar.gz::https://artifacts.elastic.co/downloads/logstash/logstash-${pkgver}-linux-x86_64.tar.gz"
        "logstash.service"
        "logstash.sysusers"
        "logstash.tmpfiles")
sha512sums=('ec8228b1f30c5dfaf33d6ca410ba220536c9e68319bffce330e91ac5878316f5f99be8ee0de89e0241cb12ba04c14331cb56132337c510f638516cfb4e0eb323'
            '5a50aacd9e1186c4535726d5baf7481133c348286dde83f9c9e9bfab7c3db960a1009165203a5eefd557c83a988571ffbf4e6c8758cbc8c4034c8cb419d04026'
            '5835c9d9f45a194566d8f3eaef679cd103403ccc4e415412bcef869d06d555a299ba3a94d726bc268b92e2cd4ad05977033f0458ebc8371d7c554a89b8559442'
            'ddaa8d5ef02e365af166dad023788fc48b01c0c45511314451c4c57a09dd92c03c99df4c3aabcf484e1b6b55268861c9e9a569635df0056e285bbcc5a399b856')

package() {
  cd logstash-${pkgver}
  install -dm 755 "${pkgdir}/usr/share/logstash" "${pkgdir}/etc/logstash"
  mv config/* "${pkgdir}/etc/logstash/"
  cp -a * "${pkgdir}/usr/share/logstash"
  chmod -R 755 "${pkgdir}/usr/share/logstash" "${pkgdir}/etc/logstash/"
  install -Dm 644 "${srcdir}/logstash.service" "${pkgdir}/usr/lib/systemd/system/logstash.service"
  install -Dm 644 "${srcdir}/logstash.sysusers" "${pkgdir}/usr/lib/sysusers.d/logstash.conf"
  install -Dm 644 "${srcdir}/logstash.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/logstash.conf"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
