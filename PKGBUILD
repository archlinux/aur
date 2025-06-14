# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=2.2.1
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices: daemon (binary release)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	'libdrm'
	'gcc-libs'
	'glibc'
)
optdepends=(
  'nvidia-utils: NVIDIA GPU support'
  'coolercontrol-liqctld'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=(coolercontrol-bin)
source=(
  "https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/${_pkgname}_${pkgver}"
  "https://gitlab.com/coolercontrol/coolercontrol/-/archive/$pkgver/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  '81ff7cfc3e2d0173054404d7245d69474960d589ed28eb6f80b449b678de8161'
  '9245c65fc8c4d4b84c3a7f13aa723735c88c128d231ed8fd6d1ce3c471d125e5'
)

check() {
  chmod +x "./${_pkgname}_${pkgver}"
  "./${_pkgname}_${pkgver}" --version
}

package() {
  install -DTm755 "./${_pkgname}_${pkgver}" "$pkgdir/usr/bin/${_pkgname}"

  cd "${srcdir}/${pkgname%d-bin}-$pkgver"

  # systemd service file
  install -Dm644 "packaging/systemd/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
