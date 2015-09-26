# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=rerodentbane-git
_pkgname=Re-rodentbane
pkgver=22.9e01f91
pkgrel=1
pkgdesc="Reincarnation of rodentbane - awesomeWM mouse-less navigation"
arch=('any')
url="https://github.com/osleg/${_pkgname}"
license=('custom:"WTFPL"')
depends=('awesome')
makedepends=('git')

source=(${_pkgname}::"git+https://github.com/osleg/${_pkgname}.git"
        'http://www.wtfpl.net/txt/copying')
md5sums=('SKIP'
         '8365d07beeb5f39d87e846dca3ae7b64')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	luac -o rerodentbane.luac rerodentbane.lua
}

package() {
  install -D -m644 "${srcdir}/${_pkgname}/rerodentbane.lua" "${pkgdir}/usr/share/awesome/lib/rerodentbane.lua"
  install -D -m644 "${srcdir}/${_pkgname}/rerodentbane.luac" "${pkgdir}/usr/share/awesome/lib/rerodentbane.luac"
  install -D -m644 "${srcdir}/copying" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

