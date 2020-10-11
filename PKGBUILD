_pkgname=apple-mac-plymouth
pkgname="${_pkgname}-git"
pkgver=1.0.r16.da00ab1
pkgrel=1
pkgdesc='Plymouth theme for someone who wants to create a complete apple theme.'
arch=('any')
url="https://github.com/Msouza91/${_pkgname}.git"
license=('GPL3.0')
depends=('plymouth')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"

  _themedir="$pkgdir/usr/share/plymouth/themes/apple-mac-plymouth"

  for N in *.png *.svg preview.sh apple-mac-plymouth.plymouth apple-mac-plymouth.script; do
    install -Dm644 $N "${_themedir}/$N"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
