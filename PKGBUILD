# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# PGP key is on keyservers
pkgname=librepcb-nightly
pkgver=0.1.4unstable.ac1eff31
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards (nightly build)"
arch=('x86_64')
url="http://librepcb.org/"
license=('GPL')
depends=('desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
provides=('librepcb')
conflicts=('librepcb')
options=('!strip' '!emptydirs')
_dirname="librepcb-nightly-linux-${arch[0]}"
source=("https://download.librepcb.org/nightly_builds/master/${_dirname}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_dirname"
}

package() {
  destdir="$pkgdir/opt/librepcb-nightly"
  mkdir -p "$destdir" "$pkgdir/usr/local/bin"
  cd "$srcdir/$_dirname"
  cp -R * "$destdir/"
  ln -s /opt/librepcb-nightly/bin/librepcb "$pkgdir/usr/local/bin/librepcb"
  ln -s /opt/librepcb-nightly/bin/librepcb-cli "$pkgdir/usr/local/bin/librepcb-cli"
}

pkgver() {
  cd "$srcdir/$_dirname"
  _version=$(bin/librepcb-cli --version | grep 'LibrePCB CLI Version' | sed 's/LibrePCB CLI Version //' | sed 's/-//g')
  _revision=$(bin/librepcb-cli --version | grep 'Git Revision' | sed 's/Git Revision //' | cut -c -8)
  printf "$_version.$_revision"
}

# vim:set ts=2 sw=2 et:
