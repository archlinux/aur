# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=latex-mk
pkgver=2.1
pkgrel=4
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
        ${pkgname}.profile texinfo.patch)
sha256sums=('6e9df1c60dafdadccc00c44dc966330fe300256dcb829cd1b04647d7b7956dde'
            '5b75ef55c25e44ca78e8b85d1b0d116f5d5532a880b1952d9e9921b2ddda5765'
            '46cc5680538d62e0c5e8162a36ae69ce114139a217430ad382859a42c8b6094b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < "$srcdir"/texinfo.patch
}

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
