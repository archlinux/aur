# Maintainer: rarebek
pkgname=victus-fan-control-git
_pkgname=victus-fan-control
pkgver=0.r1.g284944b
pkgrel=1
pkgdesc='HP Victus fan control CLI and GTK app'
arch=('any')
url='https://github.com/rarebek/victus-fan-control'
license=('MIT')
depends=('bash' 'gtk3' 'polkit' 'python' 'python-gobject')
optdepends=('libnotify: desktop notifications' 'nvidia-utils: NVIDIA GPU stats')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  install -Dm755 bin/fanctl "$pkgdir/usr/bin/fanctl"
  install -Dm755 bin/fanctl-gui "$pkgdir/usr/bin/fanctl-gui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 share/applications/victus-fan-control.desktop.in \
    "$pkgdir/usr/share/applications/victus-fan-control.desktop"
  sed -i 's|@BINDIR@|/usr/bin|g' \
    "$pkgdir/usr/share/applications/victus-fan-control.desktop"
}
