# Maintainer: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=diakonos-git
pkgver=0.9.9.r38.g9d923f7
pkgrel=1
pkgdesc="A Linux console text editor for the masses."
arch=('any')
url="http://diakonos.pist0s.ca/"
license=('MIT')
depends=('ruby-curses')
makedepends=('git')
provides=('diakonos')
conflicts=('diakonos')
source=("$pkgname::git+https://github.com/Pistos/diakonos.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf %s.r%s $(head -4 CHANGELOG|tail -1) $(git describe --tags | cut -c8- | tr - .)
}

package() {
  cd "$srcdir/$pkgname"
  ruby=$(test -x /usr/bin/ruby && echo /usr/bin/ruby || which ruby)
  $ruby install.rb --dest-dir $pkgdir --prefix /usr --conf-dir /etc
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/diakonos/LICENCE
}

