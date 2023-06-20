# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-scripts-git
pkgver=0.0.2.r9.gf46c73c
pkgrel=1
epoch=
_pkgname="archy-scripts"
pkgdesc="The archy linux utilty scripts"
arch=('any')
url="https://github.com/archy-linux/$_pkgname"
license=('Unlicense')
groups=('archy-linux' 'archy')
depends=('xorg-xinput' 'bash')
makedepends=()
checkdepends=()
optdepends=()
provides=('touchpad-toggle' 'usbmount')
conflicts=('archy-scripts')
changelog=
validpgpkeys=('4514 F39E 840E 0FFC DE9D  2815 0501 802A 1D49 6528')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver(){
  cd $_pkgname || exit 1
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $_pkgname || exit 1
  # shellcheck disable=SC2154
  install -Dm755 src/touchpad_toggle.sh "$pkgdir/usr/bin/${provides[0]}"
  install -Dm755 src/usbmount.sh "$pkgdir/usr/bin/${provides[1]}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

