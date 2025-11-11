# Maintainer: thorko contact@thorko.de
# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=elasticsearch-bin
pkgver=9.2.1
pkgrel=1
pkgdesc="Log analyzer. search, store and analyze logs"
arch=("x86_64")
url="https://github.com/elastic/elasticsearch"
license=("ELv2")
depends=("java-runtime" "libxml2")
backup=("etc/elasticsearch/jvm.options"
        "etc/elasticsearch/log4j2.properties"
        "etc/elasticsearch/elasticsearch.yml"
        "etc/elasticsearch/roles.yml")
options=("!debug")
source=("https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${pkgver}-linux-x86_64.tar.gz"
        "elasticsearch.service"
        "elasticsearch-keystore.service"
        "elasticsearch.sysusers"
        "elasticsearch.tmpfiles"
        "elasticsearch.sysctl")
sha512sums=('5a7edfb3cc5b236f9318bec2ed9d4e47427089d421d3cf3bf63b21523d94deaad61adcd9c4a364307bfe43637a26469764869000a09b3867f5b581c8a3c223b7'
            '50bd8acc3261eb891bf6f67b814aabb840b35214306b2544ada24a3439c1fe3f7c5854cc2608d97db3a688aaa2aba222e1d4d62ca1fc8d32723bcc5b34b63b57'
            '25b51fcd3913efd826f49543059edb64d1ea47a570acaf4d35131be805106cd4db58611b15d15c2910881feffc5d8f9b243da0f5dc5967574613f8d33569d959'
            '5dddb4d5e35b62d58cab22775c6400f7bef0ea7de32c43960288dcc0029c09f4056275a056f5e43a51545a3dcfe2f726c2ca316b6e9934139cda50d85b742e77'
            '8ae16e13feb63b5856ddd63c325047a3a26832232b64c9d9723e4bcc2948f0c68f0b3bdcef4aa384739d8da4c37e5afda0b45f12f3e3e4976b9cecb71aa1bac1'
            '4926e63ed247f9ced0674a55d01fdf7708b468a5f4b1bdb246f60c4e80d4980f21c811b952340d3e8d1c1dde77af87e062c1b66ec6818f90fb128a713c349050')

package() {
  cd elasticsearch-${pkgver}
  install -dm755 "${pkgdir}/usr/share/elasticsearch" "${pkgdir}/etc/elasticsearch"
  mv config/* "${pkgdir}/etc/elasticsearch/"
  cp -a * "${pkgdir}/usr/share/elasticsearch"
  chmod -R 755 "${pkgdir}/usr/share/elasticsearch" "${pkgdir}/etc/elasticsearch/"
  install -Dm644 "${srcdir}/elasticsearch.sysctl" "${pkgdir}/usr/lib/sysctl.d/elasticsearch.conf"
  install -Dm644 ${srcdir}/elasticsearch{,-keystore}.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "${srcdir}/elasticsearch.sysusers" "${pkgdir}/usr/lib/sysusers.d/elasticsearch.conf"
  install -Dm644 "${srcdir}/elasticsearch.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/elasticsearch.conf"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
