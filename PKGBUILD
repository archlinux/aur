pkgname=lattice-net-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Peer-to-peer web protocol CLI and daemon (prebuilt release)"
arch=('x86_64')
url="https://github.com/fordz0/lattice"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'systemd')
options=(!debug)
provides=('lattice-net')
conflicts=('lattice-net' 'lattice-net-git')
install=lattice-net-bin.install
source=(
  "https://github.com/fordz0/lattice/releases/download/lattice-v${pkgver}/lattice-linux-x86_64.tar.gz"
)
sha256sums=(
  '81df26d9bb69a792992a447b7f72e7ef005cf7bbc2b478960c8ac2bf908cc8d4'
)

package() {
  cd "$srcdir/lattice-linux-x86_64"

  install -Dm755 "lattice" "$pkgdir/usr/bin/lattice"
  install -Dm755 "lattice-daemon" "$pkgdir/usr/bin/lattice-daemon"
  install -Dm755 "$startdir/restart-daemon-if-active.sh" \
    "$pkgdir/usr/lib/lattice/restart-daemon-if-active.sh"
  install -Dm644 "$startdir/lattice-daemon.service" \
    "$pkgdir/usr/lib/systemd/user/lattice-daemon.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
