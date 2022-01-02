# Maintainer Vova Abdrakhmanov <369565@gmail.com>

pkgname=gala-layoutpw-plugin
pkgver=6.3.0
pkgver_old=6.1.0
pkgrel=1
pkgdesc='Gala plugin to switch layouts per window'
arch=('x86_64')
url='https://github.com/Dirli/gala-layoutpw-plugin'
license=('GPL3')
depends=('glib2' 'glibc' 'libgee' 'gala' )
makedepends=('meson' 'vala')
source=(${pkgname}-${pkgver_old}.tar.gz::https://github.com/Dirli/gala-layoutpw-plugin/archive/refs/tags/${pkgver_old}.tar.gz
        6.3.0.patch::https://github.com/citrux/gala-layoutpw-plugin/commit/f2f9b534fe3f464f9914a4ed6f4afa451f1d243c.patch)
sha256sums=('7a3039cdc90967b589936d1d7190433c3c74c6fb222654b72ec47e3c51a9a5c4'
            '980e2433d781be6937ca0a972b1c82cdb49c666aaed9a513f3030022e42a4849')
install='install.sh'

prepare() {
    cd "${pkgname}-${pkgver_old}"
    patch --forward --strip=1 --input="${srcdir}/6.3.0.patch"
}

build() {
  arch-meson ${pkgname}-${pkgver_old} build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

#vim: syntax=sh
