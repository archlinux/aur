# Maintainer: Trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
pkgname='darktable-plugin-dtmediawiki-git'
_name='dtMediaWiki'
pkgver=r59.4045142
pkgrel=2
pkgdesc='MediaWiki export plugin for darktable '
url="https://github.com/trougnouf/${_name}"
depends=('darktable' 'lua-luajson' 'lua-sec' 'lua-multipart-post')
makedepends=()
license=('GPL3')
arch=('x86_64')
source=(git+"${url}.git")
sha256sums=('SKIP')

# to enable:
# $ echo 'require "contrib/dtMediaWiki/dtMediaWiki"' >> ~/.config/darktable/luarc

pkgver() {
  cd ${_name}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	mkdir -p "${pkgdir}/usr/share/darktable/lua/contrib"
	cp -r "${srcdir}/${_name}" "${pkgdir}/usr/share/darktable/lua/contrib"
	mkdir -p "${pkgdir}/usr/share/ansel/lua/contrib"
	ln -s "/usr/share/darktable/lua/contrib/${_name}" "${pkgdir}/usr/share/ansel/lua/contrib/"
}


