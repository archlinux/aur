# Maintainer:  Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Jiří Procházka <ojirio@gmail.com>

_pkgname=lv2-ir
pkgname="${_pkgname}-git"
pkgver=1.3.2.r17.af1f8ab
pkgrel=1
pkgdesc="Real-time signal convolver esp. suited for impulse response reverb effects"
arch=('i686' 'x86_64')
url="http://factorial.hu/plugins/lv2/ir"
license=('GPL')
depends=('gtk2>=2.16' 'libsamplerate' 'zita-convolver')
provides=('ir.lv2' "${_pkgname}")
conflicts=('ir.lv2' "${_pkgname}")
groups=('lv2-plugins')
makedepends=('lv2')
source=("${_pkgname}::git+https://github.com/Anchakor/ir.lv2.git")
md5sums=('SKIP')
changelog=ChangeLog

pkgver() {
  cd "${srcdir}/${_pkgname}"

  version="$(awk -F'"' '/S1 "version/ {print $2}' ir_gui.cc)"
  echo ${version#version}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  cd "${srcdir}/${_pkgname}"

  make $MAKEFLAGS
  make convert4chan $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX="$pkgdir/usr" install
  install -Dm755 convert4chan "$pkgdir/usr/bin/convert4chan"
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
