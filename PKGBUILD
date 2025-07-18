# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=2.2.2
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
  '5ffbbf20d01c7c2bdf2ccaa7a5f2a0c2b50ff84e3a99c5a3bc7a272dab83a25b'
  'e71badaaedb87418788523e8053e3ac353c4dcde41ddf5fb2780daa68ed36dcc'
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
