# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=triceratops-lv2
pkgname="${_pkgname}-git"
pkgver=0.2.1.r2.334d2da
pkgrel=1
pkgdesc="Polyphonic synthesizer LV2 plugin"
arch=(i686 x86_64)
url="http://deliriumdecrypted.blogspot.com/"
license=('GPL3')
groups=('lv2-plugins')
depends=('gtkmm' 'lv2')
makedepends=('python2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
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
