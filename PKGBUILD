pkgname=swig-git
pkgrel=1
pkgver=rel.3.0.8.r3.ga8cf1ed
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=("x86_64")
url="http://www.swig.org/"
license=("custom")
depends=("zlib" "pcre2")
makedepends=("git")
conflicts=("swig")
provides=("swig")

_gitroot="https://github.com/swig/swig"
_gitname="swig"
_gitbranch="master"

source=("${_gitname}::git+https://github.com/swig/${_gitname}#branch=${_gitbranch}")
sha1sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --disable-all-lang --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}

