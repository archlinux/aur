# Maintainer: Brodi Elwood <brodielwood@gmail.com>
#

pkgname=fauxput-bin
_pkgname=fauxput
pkgver=0.6.1
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
sha256sums=('e707538fb96f7a3ea9bd3b0671f6016c2fd272868dadc083d1d9e3848db5aa1e')

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
