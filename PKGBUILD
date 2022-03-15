# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
_base=mmm-mode
pkgname=emacs-${_base}-git
pkgver=20191017
pkgrel=1
pkgdesc="Minor mode for Emacs that allows Multiple Major Modes to coexist in one buffer"
arch=(any)
url="http://${_base}.sourceforge.net"
license=(GPL)
depends=(emacs)
makedepends=(git)
provides=(emacs-${_base} ${_base})
conflicts=(emacs-${_base} ${_base})
source=(git+https://github.com/purcell/${_base}.git diacritics.patch)
sha512sums=('SKIP'
  'ad92d6bdf85f15c6cee892fa0813a37151f32ceb2c81b2d43ab76cda58479539b3f468bed422b88cc4bc7b7b3b5a79a13e747f163edfc5a6644a9b95936d7285')

pkgver() {
  cd ${_base}
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

prepare() {
  cd ${_base}
  patch -Np1 <"$srcdir"/diacritics.patch
}

build() {
  cd ${_base}
  mv configure.in configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_base}
  make DESTDIR="$pkgdir/" install
}