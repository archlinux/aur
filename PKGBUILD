# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=6.6.5
pkgrel=0
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
  source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
  sha256sums=('f702612dea8dd6649c33e5af94f12ebd4035c208c1952e7f2c124e7cef77b91f')
fi
if [ "$CARCH" = "armv6h" ]; then
  source=("${pkgname}-${pkgver}_armv6h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv6.tar.gz")
  sha256sums=('dd1f46a5dbce2bfd7bf01ba42fcb7bbac851ef104226075632425cae7697c161')
fi
if [ "$CARCH" = "x86_64" ]; then
  source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
  sha256sums=('0378260923421e474f49f1b88a478c2157b6eb5eeaf6dbd1c0b76c68caca9479')
fi
if [ "$CARCH" = "aarch64" ]; then
  source=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
  sha256sums=('7f4ab59bf21e9e24732961d117022bbb0b566c92d0e963af892f031f423c6408')
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
