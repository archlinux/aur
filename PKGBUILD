# Maintainer: Will Price <willprice94@gmail.com>
# Contributor: Aaron Sloman <a.sloman@cs.bham.ac.uk>
# Contributor: Steve Leach <sfkleach@gmail.com>

pkgname=poplog
pkgver=0.2.1
pkgrel=1
pkgdesc="poplog development system"
arch=('x86_64')
url="https://getpoplog.github.io/"
license=('custom:poplog')
depends=('tcsh' 'libxext' 'libxt' 'openmotif' 'libxp' 'ncurses5-compat-libs')
optdepends=('espeak: for run-speaking-eliza demo')
source=("https://github.com/GetPoplog/Seed/releases/download/v${pkgver}/poplog-${pkgver}.tar.gz")
md5sums=('3623cf0ce5f6e9f4b3e60bca3ff8d621')
#source=("${pkgname}-${pkgver}.tar.gz")
conflicts=(poplog-git)

_prefix=/opt
_bindir=/usr/bin

build() {
  cd "$srcdir/poplog-$pkgver"
  make bindir="$_bindir" prefix="$_prefix"
}

package() {
  mkdir -p "$pkgdir/usr/share/man/man1"

  cd "$srcdir/poplog-$pkgver"
  make install DESTDIR="$pkgdir" prefix="$_prefix" bindir="$_bindir"

  for f in "$pkgdir/$_prefix/share/poplog/current_usepop/pop/doc/man/"*; do
    ln -fs -t "$pkgdir/usr/share/man/man1" "${f##$pkgdir}"
  done 
}

# vim:set ts=2 sw=2 et:
