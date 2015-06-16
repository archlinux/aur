# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Luke McCarthy <luke@iogopro.co.uk>

pkgname=ns
pkgver=2.35
pkgrel=4
pkgdesc="Discrete event simulator targeted at networking research"
url="http://www.isi.edu/nsnam/ns/"
license=('GPL')
depends=('gcc-libs' 'otcl')
makedepends=('tclcl')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/nsnam/ns-2/"${pkgver}"/ns-src-"${pkgver}".tar.gz
        ns-2.35-linkstate-erase.fix
        ns-2.35-tcl86.patch
        ns-2.35-getopts.patch)
sha256sums=('2a32e831bcec7d255042a544577559d15eae67696d0e3d30881cedc1112e2387'
            'aedba646d1bc4d716031f9ea996e6d99c9bb227e7647138cccf39bdd6c069c3a'
            '7aa4a22492f2be37c81fcdc813972a6bde105e183a013d7b814a56f7bcef872c'
            '4d02ff0cf1c79d67c440c788d7163c7c873a6e4e2970bab3319cbe29f9b20c14')

optdepends=('nam: Tcl/TK based animation tool for viewing network simulation traces',
	    'xgraph: X-Windows application for interactive plotting and graphing')

prepare() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  patch -uNp1 -i ../ns-2.35-linkstate-erase.fix
  patch -uNp1 -i ../ns-2.35-tcl86.patch
  patch -uNp1 -i ../ns-2.35-getopts.patch
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  ./configure --prefix=/usr --with-tclcl=/usr/lib/tclcl
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share
  install -d "${pkgdir}"/usr/man/man1

  make DESTDIR="${pkgdir}" install
  # fix man dir in the package
  mv "${pkgdir}"/usr/man "${pkgdir}"/usr/share
}

# vim:set ts=2 sw=2 et:
