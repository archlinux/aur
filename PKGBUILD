# Maintainer: Vi0L0 <vi0l093@gmail.com>

_pkgname=amdtfset
pkgname=$_pkgname-git
pkgver=v1.0
pkgrel=1
pkgdesc="Small command-line utility to set and query the tear free desktop option present in the AMD Catalyst. Uses AMD ADL"
arch=('i686' 'x86_64')
url="https://github.com/sebth/amdtfset"
license=('GPL3')
groups=()
depends=('catalyst-utils')
makedepends=('git' 'sed')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
#backup=("etc/$_pkgname/$_pkgname.conf")
install=${pkgname}.install
source=("$_pkgname::git+https://github.com/sebth/amdtfset.git"
      'amdtfset.png'
      'amdtfset.desktop')
md5sums=('SKIP'
      'ef868543996c642350b7487d1b6b90e0'
      '25173396024bd34fa98161b864c8a2a1')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install PREFIX="$pkgdir/usr"

  install -D -m755 "$srcdir/amdtfset.png" "$pkgdir/usr/share/pixmaps/amdtfset.png"
  install -D -m755 "$srcdir/amdtfset.desktop" "$pkgdir/usr/share/applications/amdtfset.desktop"
}
