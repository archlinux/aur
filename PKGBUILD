# Maintainer: Fabio Germann <fabio.germann@gmail.com>
pkgname=usbkill-git
pkgver=r213.d3df79e
pkgrel=1
epoch=
pkgdesc="An anti-forensic kill-switch that waits for a change on your USB ports
and then immediately shuts down your computer."
arch=('any')
url="https://github.com/fabiogermann/usbkill"
license=('unknown')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("${pkgname}::git+https://github.com/fabiogermann/usbkill.git" "LICENSE")
noextract=()
sha512sums=('SKIP'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')
validpgpkeys=()

pkgver() {
  cd "${srcdir}/${pkgname}" || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}" || exit
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  python setup.py install --root "${pkgdir}" -O1
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
