# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.4.0
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices: daemon (binary release)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	"coolercontrol-liqctld=$pkgver"
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
  '824976644181d615e4e538af8aa74504b33e759cd3aecd61f0569a0f5244c685'
  '6f783f12e44c977cecd7aadd75c1a30e19a36eff6aaa25bb2fb50c45e1b8ae84'
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
