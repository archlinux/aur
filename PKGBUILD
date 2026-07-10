# Maintainer: Sean Gillespie <sean@mistersg.net>
pkgname=cardano-conf
pkgver=11.0.1_config
pkgrel=1
pkgdesc="Configuration files for Cardano core components"
arch=("any")
url="https://book.play.dev.cardano.org/"
license=('Apache-2.0')
depends=()
makedepends=('git')
provides=()
backup=(
  etc/cardano/mainnet/{byron-genesis,shelley-genesis,alonzo-genesis,conway-genesis}.json
  etc/cardano/mainnet/{config,config-legacy,peer-snapshot,topology,tracer-config}.json
  etc/cardano/mainnet/submit-api-config.json
  etc/cardano/mainnet/checkpoints.json
  etc/cardano/preprod/{byron-genesis,shelley-genesis,alonzo-genesis,conway-genesis}.json
  etc/cardano/preprod/{config,config-legacy,peer-snapshot,topology,tracer-config}.json
  etc/cardano/preprod/submit-api-config.json
  etc/cardano/preview/{byron-genesis,shelley-genesis,alonzo-genesis,conway-genesis}.json
  etc/cardano/preview/{config,config-legacy,peer-snapshot,topology,tracer-config}.json
  etc/cardano/preview/submit-api-config.json
  etc/cardano/preview/checkpoints.json
)
options=()
source=("git+https://github.com/input-output-hk/cardano-playground#tag=node-11.0.1-config")
sha256sums=('f71e60726bf632480a221fffb3f4c4ab86e08a862a583b6cc003df69a46c0e36')

package() {
  cd "cardano-playground"

  install -d "${pkgdir}/etc/cardano/"{mainnet,preprod,preview}
  for env in mainnet preview preprod; do
    install -D -m0644 \
      "static/book.play.dev.cardano.org/environments/${env}/"* \
      "${pkgdir}/etc/cardano/${env}"
  done
}
