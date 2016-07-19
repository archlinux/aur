pkgname=github-notify
_projectname=GithubNotify
pkgver=0.1.2.1
pkgrel=1
pkgdesc="GitHub notification notifier"
url="https://www.github.com/Xandaros/GithubNotify"
arch=('x86_64' 'i686')
license=('custom')
depends=('libnotify' 'notification-daemon')
makedepends=('cabal-install' 'ghc' 'gtk2hs-buildtools' 'alex' 'happy')
conflicts=()
replaces=()
backup=()
source=("https://github.com/Xandaros/GithubNotify/archive/${pkgver}.tar.gz")
md5sums=('ee729b318c8fa17f3df8ce9c0497c87f')

build() {
  cd "$srcdir/$_projectname-$pkgver"
  rm cabal.config
  cabal update
  cabal sandbox init
  cabal install --only-dependencies
  cabal build $pkgname
}

package() {
  install -Dm755 "$srcdir/$_projectname-$pkgver/dist/build/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
