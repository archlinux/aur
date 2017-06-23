pkgname=stacer
_gitname=Stacer
pkgver=1.0.7
pkgrel=1
pkgdesc="Ubuntu System Optimizer"
url="https://github.com/oguzhaninan/Stacer"
arch=('any')
license=('MIT')
depends=('electron' 'npm')
source=("https://github.com/oguzhaninan/Stacer/archive/v${pkgver}.tar.gz" $pkgname.sh $pkgname.desktop)
sha256sums=('5e4b3ae67db652ed95e0a7a88d2d5bd3bb85b17a75cf34fe39f33d49c2d6677c'
            '4bd04c3a0798453238ed834cab4a6b6a59c7f6f59d2d3ad663e61ab4e5dcd49e'
            '5b853a40cc986270bdf2ac3d6b5b42d0fe71a6373f4a382a313e71284c2037e8')

build() {
  cd "$srcdir/${_gitname}-${pkgver}"
  npm install
  npm run build
}

package() {
  cd "$srcdir/${_gitname}-${pkgver}"
  install -d "$pkgdir/opt/$pkgname"
  install -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  cp -R ./* "$pkgdir/opt/$pkgname"
  install -D assets/img/icons/icon256x256.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

