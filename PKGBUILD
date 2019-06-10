# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=print
_author=elementary
pkgname=pantheon-print
pkgver=0.1.3
pkgrel=1
pkgdesc="Simple shim for printing support via Contractor"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('cairo' 'contractor' 'glib2' 'glibc' 'gtk3' 'pango')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=("eed62f6670d8b34c16d54a3713ee2fea")

prepare() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}/build"

  DESTDIR="${pkgdir}" ninja install
}

build() {
  cd "${srcdir}/${_gitname}-${pkgver}/build"

  arch-meson ../"${pkgname}"
  ninja
}

