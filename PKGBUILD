# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname='ssh2incus-bin'
pkgver=0.6
pkgrel=2
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
)
sha256sums=(
  '73cfa1a56765ec898e5a6803bca33357179b3d447e325baf9c6a0b9621a1c804'
  '714c117e53609ce0047af745f143078fa97c7d262d6511fd659b377b5c226fa9'
)
source_x86_64=(
  "https://github.com/mobydeck/ssh2incus/releases/download/${pkgver}/ssh2incus-${pkgver}-linux-amd64.tar.gz"
)
sha256sums_x86_64=(
  '0120aff04ed64b1aa6e6728bc49819dd4ce0b2faed12f0b397a3b99641e744c3'
)
source_aarch64=(
  "https://github.com/mobydeck/ssh2incus/releases/download/${pkgver}/ssh2incus-${pkgver}-linux-arm64.tar.gz"
)
sha256sums_aarch64=(
  'b96fb4cfdf860e32c54eb54bc9d4ccf0875ba989b314db37884c33b55737daae'
)

package() {
  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "$srcdir/ssh2incus-linux-amd64" "$pkgdir/usr/bin/ssh2incus"
  elif [[ "$CARCH" = "aarch64" ]]; then
    install -Dm755 "$srcdir/ssh2incus-linux-arm64" "$pkgdir/usr/bin/ssh2incus"
  fi

  install -Dm644 "$srcdir/ssh2incus.env" "$pkgdir/etc/default/ssh2incus"
  install -Dm644 "$srcdir/ssh2incus.service" "$pkgdir/usr/lib/systemd/system/ssh2incus.service"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/ssh2incus/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/ssh2incus/LICENSE"
}