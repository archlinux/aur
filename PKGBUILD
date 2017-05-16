pkgname=stacer
_gitname=Stacer
pkgver=1.0.6
pkgrel=2
pkgdesc="Ubuntu System Optimizer"
url="https://github.com/oguzhaninan/Stacer"
arch=('any')
license=('MIT')
depends=('electron' 'npm')
source=("https://github.com/oguzhaninan/Stacer/archive/v${pkgver}.tar.gz" $pkgname.sh $pkgname.desktop)
sha256sums=('65e4365135991f1a9758d56fafb18d0a4b2901e5e7edb05f94cb24695148f7d2'
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
  install -D assets/img/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

