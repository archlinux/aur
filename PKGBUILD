# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=ePad
pkgname=${_pkgname,,}-git
pkgver=0.9.0.r136.e4bb7e8
pkgrel=1
pkgdesc='Simple text editor using Python and EFL'
arch=('any')
url='http://jeffhoogland.github.io/ePad/'
license=('GPL3')
depends=('python-efl' 'python-elmextensions-git')
makedepends=('git')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=('git://github.com/JeffHoogland/ePad.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F '"' '/^__version__/ {print $2}' epad)

  printf "${v_ver%-*}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 epad "$pkgdir/usr/bin/epad"
  install -Dm644 epad.1 "$pkgdir/usr/share/man/man1/epad.1"
}
