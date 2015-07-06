# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Frédéric Mangano <fmang+aur mg0 fr>
pkgname=kanatest
pkgver=0.4.10
pkgrel=2
pkgdesc="A simple Hiragana and Katakana drill tool"
arch=('i686' 'x86_64')
url="http://www.clayo.org/kanatest/"
license=('GPL')
depends=('gtk2' 'libxml2')
optdepends=('ttf-freefont: for using FreeSerif or FreeSans fonts'
            'ttf-arphic-uming: for using AR PL ShanHeiSun Uni font'
            'ttf-arphic-ukai: for using AR PL ZenKai Uni font')
install='kanatest.install'

_trunk=http://svn.gna.org/svn/kanatest/trunk
_rev=88

build() {
  cd "${srcdir}"
  svn co "${_trunk}"@$_rev kanatest

  rm -rf build
  cp -r  kanatest build
  cd build

  sed -i configure.ac -e 's/-Werror//'
  sh autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install || return 1
}
