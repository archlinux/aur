# Maintainer: Piotr Balwierz <my_surname at Google's webmail>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Frédéric Mangano <fmang+aur mg0 fr>
pkgname=kanatest
pkgver=20170810.19dd1a7
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
#_gitname=kanatest-code

source=("git+https://git.code.sf.net/p/kanatest/code")
sha256sums=("SKIP")

pkgver()
{
	cd "code"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}"
  
  cd code

  sed -i configure.ac -e 's/-Werror//'
  sh autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/code"
  make DESTDIR="${pkgdir}" install || return 1
}
