# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-dropbox
pkgname=${_pkgname}-git
pkgver=0.2.1.r2.g61ba51b
pkgrel=2
pkgdesc="Thunar plugin that adds dropbox context-menu (patched for thunarx-3)"
arch=('i686' 'x86_64')
url="https://github.com/Maato/thunar-dropbox"
license=('GPL3')
depends=('thunar>=1.7.0' 'dropbox')
makedepends=('python2' 'git')
source=("${_pkgname}::git+https://github.com/Maato/thunar-dropbox"
        'thunarx-3-port.patch::https://github.com/twa022/thunar-dropbox/commit/2da13dc73c56cea4a1d3de19c4917467954f985d.patch')
sha256sums=('SKIP'
            'ab12fdc792903a3e07fba3cd58c9553075a3bff672fcc45b561ccb7c5bb8e31c')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -uNp1 -r- -i ../thunarx-3-port.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python2 waf install --destdir="${pkgdir}"
}
