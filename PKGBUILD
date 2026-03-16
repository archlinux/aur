# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname='ssh2incus-bin'
pkgver=0.10
pkgrel=1
pkgdesc="SSH server for Incus instances"
arch=(
  'x86_64'
  'aarch64'
)
url='https://ssh2incus.com/'
license=('GPL-3.0-only')
depends=()
optdepends=('incus')

backup=('etc/default/ssh2incus')
install=ssh2incus.install
conflicts=('ssh2incus')

source=(
  "https://raw.githubusercontent.com/mobydeck/ssh2incus/refs/tags/${pkgver}/packaging/ssh2incus.service"
  "https://raw.githubusercontent.com/mobydeck/ssh2incus/refs/tags/${pkgver}/packaging/ssh2incus.env"
  "https://raw.githubusercontent.com/mobydeck/ssh2incus/refs/tags/${pkgver}/packaging/config.yaml"
  "https://raw.githubusercontent.com/mobydeck/ssh2incus/refs/tags/${pkgver}/packaging/create-config.yaml"
)
sha256sums=('73cfa1a56765ec898e5a6803bca33357179b3d447e325baf9c6a0b9621a1c804'
            '96d2ac38ae5b78a44441edd3ce0cb69a14474c3e0246b99634b5f4d8094a777d'
            '3bea3b09ce3eaac8131c3995a77ae1ba4ceeca29eeb02d83fa78339735e4883e'
            'e339408d677d4e16433062baaa7baafe2293443d404d58f2e929f15f5b8c6622')
sha256sums_x86_64=('0ab82dbefd45beb31662a0a8429102e2ee0f6aeb19947214a96d607ca7ca93ea')
sha256sums_aarch64=('02097c181cee268dbf9c1b48996f57f18e9867dae72d8e5c5edc600b9cd43af5')
source_x86_64=(
  "https://github.com/mobydeck/ssh2incus/releases/download/${pkgver}/ssh2incus-${pkgver}-linux-amd64.tar.gz"
)
source_aarch64=(
  "https://github.com/mobydeck/ssh2incus/releases/download/${pkgver}/ssh2incus-${pkgver}-linux-arm64.tar.gz"
)

package() {
  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "$srcdir/ssh2incus-linux-amd64" "$pkgdir/usr/bin/ssh2incus"
  elif [[ "$CARCH" = "aarch64" ]]; then
    install -Dm755 "$srcdir/ssh2incus-linux-arm64" "$pkgdir/usr/bin/ssh2incus"
  fi

  install -Dm644 "$srcdir/ssh2incus.env" "$pkgdir/etc/default/ssh2incus"
  install -Dm644 "$srcdir/config.yaml" "$pkgdir/etc/ssh2incus/config.yaml"
  install -Dm644 "$srcdir/create-config.yaml" "$pkgdir/etc/ssh2incus/create-config.yaml"
  install -Dm644 "$srcdir/ssh2incus.service" "$pkgdir/usr/lib/systemd/system/ssh2incus.service"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/ssh2incus/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/ssh2incus/LICENSE"
}
