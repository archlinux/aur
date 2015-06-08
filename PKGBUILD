# Contributor: noonov <noonov@gmail.com>

_pkgname=uim
pkgname=${_pkgname}-git
pkgver=1.8.0.alpha.r264.gfe60773
pkgrel=1
epoch=1
pkgdesc="A multilingual input method framework"
arch=('i686' 'x86_64')
url="https://github.com/uim/uim"
license=('BSD')
depends=('gtk2')
makedepends=('git' 'intltool' 'perl' 'ruby' 'librsvg' 'asciidoc' 'ed')
provides=('uim')
conflicts=('uim' 'uim-svn')
install=uim-git.install
source=("git+https://github.com/uim/uim.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --long --tags | sed -r 's/^uim-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  touch -c ${srcdir}/${_pkgname}/scm/json-parser-expanded.scm
}

build() {
  cd ${srcdir}/${_pkgname}

  ./make-wc.sh --prefix=/usr --libexecdir=/usr/lib/uim
  make
}

package() {
  cd ${srcdir}/${_pkgname}

  make -j1 DESTDIR=${pkgdir} install

  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
