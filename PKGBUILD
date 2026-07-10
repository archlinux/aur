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
source=("git+https://github.com/input-output-hk/cardano-playground?commit=e18bf6327fa9956c907739d049e9b3ec0c6a7dd6")
sha256sums=('SKIP')

package() {
  cd "cardano-playground"

  install -d "${pkgdir}/etc/cardano/"{mainnet,preprod,preview}
  for env in mainnet preview preprod; do
    install -D -m0644 \
      "static/book.play.dev.cardano.org/environments/${env}/"* \
      "${pkgdir}/etc/cardano/${env}"
  done
}
