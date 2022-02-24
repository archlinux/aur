# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=6.6.6
pkgrel=0
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
  source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
  sha256sums=('237502e26d32ec0e67946b98464eadf22526db3d031dc6150a053176bbb07d94')
fi
if [ "$CARCH" = "armv6h" ]; then
  source=("${pkgname}-${pkgver}_armv6h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv6.tar.gz")
  sha256sums=('24ef94438c25889c5b6c133a9137fd5bbf4df9639fa92827847e30077469a310')
fi
if [ "$CARCH" = "x86_64" ]; then
  source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
  sha256sums=('a8f34f6e964b4025610e2d10f01d9e0ee573323f654fd170a8270145efb615d1')
fi
if [ "$CARCH" = "aarch64" ]; then
  source=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
  sha256sums=('720a75b7d67c8a9e003fb883dbc6c33014c5d91c86f429a0933c8923b89f180f')
fi


source+=(
        "sensu-agent.service"
        "agent.yml.example"
        )
sha256sums+=(
            '7d8ca2731fe4a07beab0566d11ed47f0c069774752a96781ac7797697b3f7cc5'
            'c9997fa4be0879bb73b7250863ce9737b422515cf9131626075ff313b4575eed'
          )

install=sensu-agent.install

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}

package() {
    install -Dm755 "${srcdir}/sensu-agent" "${pkgdir}/usr/bin/sensu-agent"
    install -Dm0644 "sensu-agent.service" "${pkgdir}/usr/lib/systemd/system/sensu-agent.service"
    install -Dm0644 "agent.yml.example" "${pkgdir}/etc/sensu/agent.yml.example"
}
