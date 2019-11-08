# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=5.14.2
pkgrel=1
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
#makedepends=('')
source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz"
        "${pkgname}-${pkgver}_amd64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz"
        "sensu-agent.service"
      )
sha256sums=(
            'e6e08a4c135e696369c5e855e83cdbc21d3f653b54abdef9a1e75e526f34ad94'
            'ebb1e3595b91c0a5a46b456453130f2b1a9c5db31d776f70660513936e54bdde'
            '7d8ca2731fe4a07beab0566d11ed47f0c069774752a96781ac7797697b3f7cc5'
          )


# TODO: better build from source
# build() {}
post_install() {
  groupadd sensu
  useradd -s /sbin/nologin -d /opt/sensu -G sensu sensu
}

package() {
    install -Dm755 "${srcdir}/sensu-agent" "${pkgdir}/usr/bin/sensu-agent"
    install -Dm0644 "sensu-agent.service" "${pkgdir}/usr/lib/systemd/system/sensu-agent.service"
}

