# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=advanced-ssh-config
_name=assh
pkgver=2.9.3
_vcsref=0659d67
pkgrel=1
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64')
url='https://github.com/moul/assh'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moul/assh/archive/v${pkgver}.tar.gz")
sha256sums=('d700a23a97b579aa48ee8ecc6d30878acc0840d368c7a0089c7c20f6fa028c71')

build() {
  cd "$_name-$pkgver"
  go build \
     -trimpath \
     -buildmode=pie \
     -mod=readonly \
     -modcacherw \
     -ldflags "-extldflags ${LDFLAGS}" \
     -ldflags "-X 'moul.io/assh/v2/pkg/version.Version=${pkgver}' -X 'moul.io/assh/v2/pkg/version.VcsRef=${_vcsref}'" \
     -o assh \
     .
}

check() {
  cd "$_name-$pkgver"
  go test ./...
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 assh "${pkgdir}/usr/bin/assh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:


