pkgname=stacer-git
_gitname=Stacer
pkgver=v1.0.6.r6.gc22c273
pkgrel=3
pkgdesc="Ubuntu System Optimizer"
url="https://github.com/oguzhaninan/Stacer"
arch=('any')
license=('MIT')
depends=('electron' 'npm')
conflicts=('stacer')
source=("git://github.com/oguzhaninan/$_gitname.git" $pkgname.sh $pkgname.desktop)
sha256sums=('SKIP'
            '96c90af9d95e01f45141c63a22c38fc7a090543138f8864b7601112895c5cd3e'
            '5c1a6698d1dd4ac2b09ef684564fc120765dd028dbe31fe17ce1d745f1fc4291')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  npm install
  npm run build
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/opt/$pkgname"
  install -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  cp -R ./* "$pkgdir/opt/$pkgname"
  install -D assets/img/icons/icon256x256.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

