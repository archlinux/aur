# Maintainer: ddvital <ddvital@gmail.com>
pkgname=cliptui-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A beautiful terminal-based clipboard history manager (binary release)"
arch=('x86_64')
url="https://github.com/ddvital/cliptui"
license=('MIT')
provides=('cliptui')
conflicts=('cliptui')
depends=('xsel')
optdepends=('wl-clipboard: Wayland clipboard support')
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('805c29661d5cc3dfd21a19beed74594fac74a8b768cfeb5446dc5b32885779cf')

package() {
  install -Dm755 cliptui "$pkgdir/usr/bin/cliptui"

  # Install systemd service if included in tarball
  if [ -f systemd/cliptui.service ]; then
    install -Dm644 systemd/cliptui.service "$pkgdir/usr/lib/systemd/user/cliptui.service"
  fi

  # Install docs if available
  [ -f README.md ] && install -Dm644 README.md "$pkgdir/usr/share/doc/cliptui/README.md"
  [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cliptui/LICENSE"
}
