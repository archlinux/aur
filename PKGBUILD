# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=6.7.1
pkgrel=1
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
  source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
  sha256sums=('93dc68a6365b48c8dbaa5801db2bd9c69d7eaa4fe0a1e1c1e82849dd4b97e0ae')
fi
if [ "$CARCH" = "x86_64" ]; then
  source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
  sha256sums=('00fb5a308d92dfce3bf498a8d337f7dc9a477aa71fec3b66b1e40fbee31a91b0')
fi
if [ "$CARCH" = "aarch64" ]; then
  source=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
  sha256sums=('443748ad3409ee08aaccff07847f5d336d0c29beda105339c9b7345102679f2d')
fi

install=sensu-agent.install

source+=(
        "sensu-agent.service"
        "agent.yml.example"
        )
sha256sums+=(
            '7d8ca2731fe4a07beab0566d11ed47f0c069774752a96781ac7797697b3f7cc5'
            'c9997fa4be0879bb73b7250863ce9737b422515cf9131626075ff313b4575eed'
          )

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

package() {
    install -Dm755 "${srcdir}/sensu-agent" "${pkgdir}/usr/bin/sensu-agent"
    install -Dm0644 "sensu-agent.service" "${pkgdir}/usr/lib/systemd/system/sensu-agent.service"
    install -Dm0644 "agent.yml.example" "${pkgdir}/etc/sensu/agent.yml.example"
}
