# Maintainer: Cody P Schafer <archlinux at codyps.com>
_bpn=python2-shaape
pkgname=${_bpn}-git
pkgver=1.1.1.r2.gc8c8dd7
pkgrel=1
pkgdesc="ascii art to image converter designed to be used with asciidoc"
arch=(any)
url="https://github.com/christiangoltz/shaape"
license=('BSD')
groups=()
depends=('python2' 'pygtk' 'python2-networkx' 'python2-yaml')
makedepends=(git)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=(git+https://github.com/christiangoltz/shaape)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/shaape"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/shaape"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  local _d="$pkgdir/etc/asciidoc/filters/shaape"
  mkdir -p "${_d}"
  cp asciidoc-filter/shaape-filter.conf "${_d}"
}

# vim:set ts=2 sw=2 et:
