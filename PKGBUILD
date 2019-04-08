# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=morty
pkgver=0.2.0
pkgrel=1
pkgdesc='Privacy-aware web content sanitizer proxy-as-a-service'
arch=(i686 x86_64)
url=https://github.com/asciimoo/morty
license=(AGPL3)
conflicts=(morty-git)
depends=(openssl)
makedepends=(go)
optdepends=('searx: A privacy-respecting, hackable metasearch engine'
            'searx-git: A privacy-respecting, hackable metasearch engine (git)')
install=morty.install
source=($url/archive/v$pkgver.tar.gz
        morty.service
        morty.install)
sha512sums=('10b08b07dfa54adf1b465311d1cf57ea46ecd09800ebba8d053abeb8f2b660685700bb665dba2741de3f17fa6c27a2c70a56d5a615c8734ca1ec8d3929260b88'
            'b967d4aebbf869d5867c39ef50cc286c01b0c2ec7fdda4d4d92771a99847c85a3218cedd4bd55797d46ffa2f8a23e547a8326fb9a530214b544d1366c0232190'
            'f140145c1c6d9b76176305cf0cd8f6e7457213cf30662a27a23d287d2c7378e54679899a74c0e0af9b3c599852721765f21fb80653f8ecfebb655a06b4b74445')

build() {
  cd morty-$pkgver
  GOPATH="$srcdir"/morty-$pkgver go get -v -x github.com/asciimoo/morty
}

package() {
  install -Dm 644 morty.service -t "$pkgdir"/usr/lib/systemd/system

  cd morty-$pkgver

  install -D bin/morty -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/morty
}
