# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_pkgname=geany-jedi-complete
pkgname="${_pkgname}-gtk3"
pkgver=8eba66e8
pkgrel=1
pkgdesc="A Geany plugin that provides Python code completion using jedi"
arch=('i686' 'x86_64')
url="https://github.com/notetau/geany-jedi-complete"
license=('GPL2')
depends=('geany-gtk3' 'curl')
optdepends=('python-jedi: Awesome autocompletion for python'
	    'python2-jedi: Awesome autocompletion for python2')
source=("${_pkgname}.tar.gz::https://github.com/notetau/${_pkgname}/archive/${pkgver}.tar.gz"
        "geany-jedi-complete.patch")
md5sums=('861ac1dc0d1fc3499c9bbd8641a717a5'
        '42f30b36bb2597bf92785428a0a5108f')

build() {
  cd "${srcdir}/$(tar -tf ${_pkgname}.tar.gz | head -n 1)"
  patch -p2 -i ../geany-jedi-complete.patch
  make
}

package() {
  mkdir -p "$pkgdir$(pkg-config --variable=libdir geany)/geany"
  cd "${srcdir}/$(tar -tf ${_pkgname}.tar.gz | head -n 1)"
  
  make PREFIX="$pkgdir$(pkg-config --variable=libdir geany)/geany" install

  # Doc files
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # License
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 cc=80 et:
