# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: ml <>

pkgname=helm-secrets
pkgver=4.4.1
pkgrel=1
pkgdesc="Helm plugin to manage secrets with Git workflow and store them anywhere"
arch=(any)
url=https://github.com/jkroepke/helm-secrets
license=(Apache)
install=helm-secrets.install
depends=(bash helm)
optdepends=(
  'sops: secret driver'
  'vault: secret driver'
)
source=(https://github.com/jkroepke/helm-secrets/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('0d5a61e5d62f071f2ddecc64a75cef26925449bb72ee44f2328179d9851c6adb')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '/platformCommand:/,+2 d' plugin.yaml
}

package() {
  cd "${pkgname}-${pkgver}"
  local _dest="${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
  install -Dm0644 plugin.yaml -t "$_dest"
  # copy whole scripts directory but remove the install script
  cp -ar scripts/ -t "$_dest"
  rm -f "$_dest/install.sh"
}

# vim: set ts=2 sw=2 et:
