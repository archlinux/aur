# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_pkgname=jacker
pkgname="$_pkgname-hg"
pkgver=r210+.8378809cad50+
pkgrel=1
pkgdesc="a JACK MIDI Tracker"
url="https://bitbucket.org/paniq/jacker"
arch=('x86_64')
license=('Apache')
makedepends=('mercurial' 'scons')
depends=('gtkmm' 'jack')

source=("hg+https://bitbucket.org/paniq/jacker")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  # patch python2-style print statements
  sed -i "s/^\\( *\\)print \\(.*\\)$/\\1print(\\2)/" "${_pkgname}/site_scons/site_init.py"
  sed -i "s/^\\( *\\)print \\(.*\\)$/\\1print(\\2)/" "${_pkgname}/site_scons/site_tools/tool_test.py"
  sed -i "s/^\\( *\\)print \\(.*\\)$/\\1print(\\2)/" "${_pkgname}/site_scons/site_tools/xplib.py"
}

build() {
  cd "$_pkgname"
  scons
}

package() {
  cd "$_pkgname"
  scons install prefix=/usr destdir="$pkgdir"
}
