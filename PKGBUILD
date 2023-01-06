# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=jgmenu
_pkgver=4.4.1
pkgname=${_pkgname}-minimal
pkgver=4.4.1+a165616
pkgrel=1
pkgdesc="Simple, independent, contemporary-looking X11 menu, designed for scripting, ricing and tweaking. Compiled with gtktheme support"
arch=('x86_64')
url="https://github.com/johanmalm/${_pkgname}"
license=('GPL2')
depends=('libx11' 'cairo' 'pango' 'libxrandr' 'librsvg' 'libxml2' 'glib2')
optdepends=('python')
provides=(${_pkgname})
conflicts=(${_pkgname})

source=("git+${url}.git#tag=v${_pkgver}"
        'remove-unwanted-mans.patch')
sha256sums=('SKIP'
            'ec3e0176486b0e18779145584ac76831292e8466269559f1ba23d48d94b54665')

prepare() {
  cd ${_pkgname}

  patch -Np1 -i "$srcdir/remove-unwanted-mans.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s+%s" "${_pkgver}" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --with-gtktheme --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
}
