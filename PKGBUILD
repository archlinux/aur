# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname=gladtex2
pkgver=3.1
pkgrel=1
pkgdesc="A utility for writing LaTeX equations within HTML - Python rewrite"
depends=('python>=3.4' 'texlive-bin' 'texlive-latexextra')
makedepends=('pandoc')
conflicts=('gladtex')
arch=('i686' 'x86_64')
license=('LGPL')
url="https://humenda.github.io/GladTeX/"
source=( "https://github.com/humenda/GladTeX/archive/v${pkgver}.tar.gz" )
sha256sums=('d12dd28a4440302f9013a8710cd8169f89d16e622494130975cc587316080da3')

build() {
  cd "$srcdir/GladTeX-$pkgver"
  python ./setup.py build
  pandoc manpage.md -s -t man -o build/gladtex.1
}

package() {
  cd "$srcdir/GladTeX-$pkgver"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
  install -m 644 -D build/gladtex.1 "$pkgdir"/usr/man/man1/gladtex.1
}

# vim: set ts=2 sw=2 et:
