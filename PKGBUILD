pkgname=stacer
_gitname=Stacer
pkgver=v1.0.1.r44.ga13ef59
pkgrel=1
pkgdesc="Ubuntu System Optimizer"
url="https://github.com/oguzhaninan/Stacer"
arch=('any')
license=('MIT')
depends=('electron' 'npm')
source=("git://github.com/oguzhaninan/$_gitname.git" $pkgname.sh $pkgname.desktop)
sha256sums=('SKIP'
            '4bd04c3a0798453238ed834cab4a6b6a59c7f6f59d2d3ad663e61ab4e5dcd49e'
            '5b853a40cc986270bdf2ac3d6b5b42d0fe71a6373f4a382a313e71284c2037e8')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  npm install
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/opt/$pkgname"
  install -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  cp -R ./* "$pkgdir/opt/$pkgname"
  install -D assets/img/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

