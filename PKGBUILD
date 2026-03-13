pkgname=lattice-net-bin
pkgver=0.1.7
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
  '2ec4c9e1d59decb71da10f863eaf7b640ab5edae3d8492c9e72918acbb5e747a'
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
