# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=triceratops-lv2
pkgname="${_pkgname}-git"
pkgver=0.3.2.r11.b058700
pkgrel=1
pkgdesc="Polyphonic synthesizer LV2 plugin"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/triceratops/"
license=('GPL3')
groups=('lv2-plugins')
depends=('gtkmm')
makedepends=('git' 'python2' 'lv2')
conflicts=("${_pkgname}" "${_pkgname//-/.}")
provides=("${_pkgname}" "${_pkgname//-/.}")
source=("${_pkgname}::git+https://github.com/thunderox/triceratops.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"

  local ver=$(grep "^VERSION" wscript | cut -d "'" -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/${_pkgname}"

  python2 waf install --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
