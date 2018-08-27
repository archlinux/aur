# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=advanced-ssh-config
pkgver=2.8.0
pkgrel=1
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64' 'i686')
url='https://github.com/moul/advanced-ssh-config'
license=('MIT')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=github.com/moul/advanced-ssh-config/cmd/assh

build() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "${srcdir}/src/github.com/moul/${pkgname}/"
  git checkout "tags/v${pkgver}"
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:


