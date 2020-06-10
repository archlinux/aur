# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=advanced-ssh-config
_name=assh
pkgver=2.10.0
_vcsref=1ff23be
pkgrel=1
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64')
url='https://github.com/moul/assh'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moul/assh/archive/v${pkgver}.tar.gz")
sha256sums=('7cc2ff54c5fc04d2b5cbe0b073ef2fef112e5b3ef9185408b708625e572c83c1')

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


