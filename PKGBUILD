# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.4.2
pkgrel=1
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
  '0185f95f000cf2a587ceecde9aadaf58901afe9a35fdc56acf7e1df81c56b13e'
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
