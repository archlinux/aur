# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps dot aur dot archlinux dot org>

_pkgname=beatslash-lv2
pkgname="${_pkgname}-git"
pkgver=1.0.4.r28.48efeda
pkgrel=1
pkgdesc="A set of LV2 plugins to mangle, slash, repeat and do much more with your beats."
arch=('i686' 'x86_64')
url="http://objectivewave.wordpress.com/beatslash-lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'gtkmm')
makedepends=('python' 'lvtk')
provides=('lv2.beatslash' "${_pkgname}")
conflicts=('lv2.beatslash' "${_pkgname}")
source=("${_pkgname}::git+https://github.com/blablack/beatslash-lv2.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python waf configure --prefix=/usr
  python waf
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf --destdir="${pkgdir}/" install
}
