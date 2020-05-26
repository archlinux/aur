# Maintainer: ml <ml@visu.li>
# TODO add test. update to HEAD
pkgname=helm-secrets
pkgver=2.0.2
pkgrel=1
pkgdesc='Helm plugin to manage secrets with Git workflow and store them anywhere'
arch=('any')
url='https://github.com/zendesk/helm-secrets'
license=('Apache')
install=helm-secrets.install
depends=('helm' 'bash')
optdepends=('sops')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('282b3ebd60f726c25194451489b048de56cee2c75ade6d3242cee956fec3026d')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '/^hooks:$/Q' plugin.yaml
}

# check(): Go tests require special test environment

package() {
  cd "${pkgname}-${pkgver}"
  # shell scripts don't belong in /usr/lib, but other plugins reside there as well.
  # will fix later
  install -Dm755 secrets.sh -t "${pkgdir}/usr/lib/helm/plugins/${pkgname}"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname}"
}
