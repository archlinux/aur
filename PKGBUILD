# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=cl-shop2
_clname=shop2
pkgver=2.9.0
pkgrel=1
pkgdesc="SHOP (Simple Hierarchical Ordered Planner) is a domain-independent automated-planning system that is based on ordered task decomposition, which is a type of Hierarchical Task Network (HTN) planning"
arch=('i686' 'x86_64')
url="http://www.cs.umd.edu/projects/shop/description.html"
license=('GPL')
depends=('common-lisp' 'cl-asdf')
source=(http://downloads.sourceforge.net/project/shop/${_clname}-${pkgver}.tar.gz
        shop2.install)
install=shop2.install
md5sums=('2d5a41d420cca0ccb11d15072a770dac'
         '7fd236d53a01011699d57541c421c6fd')
sha256sums=('69f552d5a6f7e25fb3213910dada43dc1529f2071115a3abc8745a405ece59f0'
            '98adaa027310b300876497f77e78968e7399df81d90a25198ba86218e8125ddc')
sha384sums=('8217ab28a650a983bd62a3c52f1a958987c0f054e79fa34373ed024bd048d0bc5392262d6ede7f16e4d26cbe4cc4ca6f'
            'dfef77995103f38281a14a4827b2dc0d3108a3b358a1b17510c0a885e452e5affc2cdd4cd96e369adef89c75ac4d2063')
sha512sums=('058d2150154af6f0127dd4f3c4a6d44b9a5dc09c2e593c462efd0f9e53c4785da363a72bd8a9ca9265351bd7800d20041107c9caf228565db4c5984ef34ef8f6'
            '4af38c2a9bfd399df4942f315dee52e3277648e879802650e33f55d92d49e68e7deb345bffabe4f9f9221e7dab6ebe17d9056091382fc20af1e6b932cf70880b')


build() {
  cd "${srcdir}/${_clname}-${pkgver}"

  # patches for ecl
  sed 's/or allegro sbcl ccl clisp/or allegro sbcl ccl clisp ecl/g' -i shop-asd.asd
  sed 's/#+clisp (ext:gc)/#+clisp (ext:gc) #+ecl (ext:gc)/g' -i shop2.lisp
  sed 's/or :ccl :allegro :sbcl clisp/or :ccl :allegro :sbcl clisp ecl/g' -i shop2.lisp
  sed 's/or :cCL :allegro :sbcl clisp/or :cCL :allegro :sbcl clisp ecl/g' -i shop2.lisp
}

package() {
  cd "${srcdir}/${_clname}-${pkgver}"

  install -dm 755 "${pkgdir}/usr/share/common-lisp/source/${_clname}"
  cp -r * "${pkgdir}/usr/share/common-lisp/source/${_clname}"

  install -dm 755 "${pkgdir}/usr/share/common-lisp/systems"
  cd "${pkgdir}/usr/share/common-lisp/systems"
  ln -s ../source/${_clname}/${_clname}.asd .
}

