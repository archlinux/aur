# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=ePad
pkgname=${_pkgname,,}-git
pkgver=0.5.7.r62.7692223
pkgrel=1
pkgdesc="Simple text editor using Python and EFL"
arch=('any')
url="https://github.com/JeffHoogland/ePad"
license=('GPL3')
depends=('python-efl' 'bash')
makedepends=('git')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=("git://github.com/JeffHoogland/ePad.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F '"' '/^__version__/ {print $2}' ePad.py)

  printf "${v_ver%-*}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir/usr/share/epad/"
  install -m644 *.py "$pkgdir/usr/share/epad/"
  install -Dm755 epad "$pkgdir/usr/bin/epad"
  install -Dm644 epad.1 "$pkgdir/usr/share/man/man1/epad.1"
}
