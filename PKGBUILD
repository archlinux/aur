# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
pkgname='darktable-lua-scripts-git'
_name='lua-scripts'
pkgver=r407.54572de
pkgrel=1
pkgdesc='Lua scripts extending darktable'
url='https://github.com/darktable-org/'
depends=('darktable')
optdepends=(	'hugin: hugins support'
		'enblend-enfuse: enfuse support')
makedepends=()
license=('GPL3')
arch=('i686' 'x86_64')
source=(git+"${url}${_name}.git")
sha256sums=('SKIP')

# To enable one of the scripts you have to add a line like require "examples/hello_world" to your: ~/.config/darktable/luarc (Linux/Unix)

pkgver() {
  cd ${_name}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	mkdir -p "${pkgdir}/usr/share/darktable"
	cp -r "${srcdir}/${_name}" "${pkgdir}/usr/share/darktable/lua"
}

