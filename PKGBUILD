# Maintainer: Saeed Andalib <saeedandalib5@gmail.com>
_themename=arch-tan

pkgname=plymouth-$_themename-git
pkgver=r7.de2d895
pkgrel=1
pkgdesc='Animated and minimal bootup/shutdown splash featuring Arch-tan'
arch=('any')
url='https://github.com/SSeanin/plymouth-arch-tan'
license=('GPL-3.0-or-later')
makedepends=('git')
provides=("plymouth-$_themename")
conflicts=("plymouth-$_themename")
install="$_themename.install"
source=('git+https://github.com/SSeanin/plymouth-arch-tan.git')
sha256sums=('SKIP')

pkgver() {
  cd $"$srcdir/plymouth-$_themename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/plymouth-${_themename}"

  local themedir="$pkgdir/usr/share/plymouth/themes/${_themename}"

  install -Dm644 arch-tan.plymouth "$themedir/arch-tan.plymouth"
  install -Dm644 arch-tan.script "$themedir/arch-tan.script"

  for frame in assets/frames/*; do
    install -Dm644 "$frame" "$themedir/assets/frames/${frame##*/}"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
