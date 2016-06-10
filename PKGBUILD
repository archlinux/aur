# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=latex-mk
pkgver=2.1
pkgrel=3
pkgdesc="tool for managing LaTeX projects"
arch=('any')
url="http://latex-mk.sourceforge.net"
license=('GPL')
depends=('make' 'texlive-core')
optdepends=('cups: Common UNIX Printing System(tm)'
            'imagemagick: Image processing tools'
            'gv: PostScript and PDF viewer for X '
            'hevea: Translates from LaTeX to HTML, info, or text'
            'latex2rtf: Converts documents from LaTeX to RTF format'
            'tgif: Interactive 2-D drawing facility under X11'
            'transfig: Utilities for converting XFig figure files')
source=(http://downloads.sourceforge.net/latex-mk/$pkgname-$pkgver.tar.gz
        ${pkgname}.profile)
md5sums=('6a9fd9ec2de0169297c1d0228a41fa2b'
         '3fb6cd18ba64619cfb658fc92d85db92')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -d ${pkgdir}/etc/profile.d
  install -D -m755 ${srcdir}/${pkgname}.profile \
    ${pkgdir}/etc/profile.d/${pkgname}.sh
}
