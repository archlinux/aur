# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Arthur Țițeică / arthur dot titeica with gmail

pkgname=morty-git
pkgver=0.2.0+12+gfe94d9a
pkgrel=1
pkgdesc='Privacy-aware web content sanitizer proxy-as-a-service (git)'
arch=(i686 x86_64)
url=https://github.com/asciimoo/morty
license=(AGPL3)
provides=(morty)
conflicts=(morty)
makedepends=(git go)
optdepends=('searx: Privacy-respecting, hackable metasearch engine')
source=(git+$url
        morty.service)
sha512sums=('SKIP'
            'b967d4aebbf869d5867c39ef50cc286c01b0c2ec7fdda4d4d92771a99847c85a3218cedd4bd55797d46ffa2f8a23e547a8326fb9a530214b544d1366c0232190')

pkgver() {
  cd morty
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd morty
  GOPATH="$srcdir"/morty go get -v -x github.com/asciimoo/morty
}

package() {
  install -Dm 644 morty.service -t "$pkgdir"/usr/lib/systemd/system

  cd morty

  install -D bin/morty -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/morty
}
