# Maintainer: Winícius Cota <winicius.cota@gmail.com>

_pkgname=rofi-translate
pkgname="${_pkgname}-git"
pkgver=r28.84356fd
pkgrel=1
pkgdesc='Simple rofi script for translation based on translate shell'
arch=('any')
url='https://github.com/garyparrot/rofi-translate'
license=('MIT')
depends=('translate-shell' 'rofi' 'mplayer')
makedepends=('git')
source=("git+$url" 'default-language.patch')
md5sums=('SKIP' '1bef53ea756773942ed2788a425b2a8c')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$_pkgname
	patch -p1 -i "$srcdir/default-language.patch"
}

package() {
	install -Dm755 ${_pkgname}/rofi_trans "${pkgdir}/usr/bin/rofi_trans"
	install -Dm755 ${_pkgname}/rofi_trans_brief "${pkgdir}/usr/bin/rofi_trans_brief"
	install -Dm755 ${_pkgname}/rofi_trans_delete "${pkgdir}/usr/bin/rofi_trans_delete"
	install -Dm755 ${_pkgname}/rofi_trans_verbose "${pkgdir}/usr/bin/rofi_trans_verbose"
	install -Dm755 ${_pkgname}/rofi_verbose "${pkgdir}/usr/bin/rofi_verbose"
}
