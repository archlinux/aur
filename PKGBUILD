# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=uefi_r2
pkgname=uefi_r2-git
pkgver=r50.9bb55ba
pkgrel=1
pkgdesc="Core library for PSlab desktop"
arch=('any')
url="https://github.com/binarly-io/${_pyname}"
license=('GPL3')
depends=(
  'python'
  'python-r2pipe'
  'radare2'
)
makedepends=('git')
provides=("$_pyname")
conflicts=(uefi_r2)
options=(!emptydirs)
source=(git://github.com/binarly-io/${_pyname}.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pyname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pyname}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 755 uefi_r2_analyzer.py "$pkgdir/usr/bin/uefi_r2_analyzer"
}

# vim:set ts=2 sw=2 et:
