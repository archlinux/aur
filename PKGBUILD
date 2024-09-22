# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.4.1
pkgrel=2
pkgdesc="A program to monitor and control your cooling devices: daemon (binary release)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	'coolercontrol-liqctld'
	'libdrm'
	'gcc-libs'
	'glibc'
)
optdepends=(
  'nvidia-utils: NVIDIA GPU support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=(coolercontrol-bin)
source=(
  "https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/$_pkgname"
  "https://gitlab.com/coolercontrol/coolercontrol/-/archive/$pkgver/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  '94e27607338848987c8be34daffea46f89f63d223dd0dd88b90a71e2cddc7865'
  '378ca7d9bb4ffc5caa5fe08c17e4a2986397a59c7305fb1511140e52b7950098'
)

check() {
  chmod +x ./coolercontrold
  ./coolercontrold --version
}

package() {
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"

  cd "${srcdir}/${pkgname%d-bin}-$pkgver"

  # systemd service file
  install -Dm644 "packaging/systemd/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
