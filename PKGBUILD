# Maintainer: Brodi Elwood <brodielwood@gmail.com>
#

pkgname=fauxput-bin
_pkgname=fauxput
pkgver=0.7.0
pkgrel=1
pkgdesc='Manage virtual displays on Linux (prebuilt binary)'
arch=('x86_64')
url='https://github.com/bdelwood/fauxput'
license=('MIT')
depends=(
  'bash'
  'libcap'
  'libxcvt'
  'util-linux'
  'wayland'
)
optdepends=(
  'sunshine: game-streaming server integration (see /usr/share/fauxput/)'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install='fauxput.install'
source=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('68df25d9fd8a18a857304f259a6274d59f79b7884ca213fbaafe852a1c1ace13')

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/$_pkgname"

  install -Dm755 -t "${pkgdir}/usr/share/$_pkgname/" \
    contrib/sunshine-fauxput-up.sh \
    contrib/sunshine-fauxput-down.sh
  install -Dm644 contrib/sunshine-apps.json.example \
    "${pkgdir}/usr/share/$_pkgname/sunshine-apps.json.example"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
