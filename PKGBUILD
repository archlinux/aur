# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=diakonos
pkgname="$_pkgname"-git
pkgver=0.10.0.r42.gfe8991c
pkgrel=3
pkgdesc="A Linux console text editor for the masses."
arch=('any')
url="https://git.sr.ht/~pistos/diakonos"
license=('MIT')
depends=('ruby' 'ruby-curses' 'ruby-language_server-protocol')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+$url#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's+sitelibdir+vendorlibdir+' install.rb
}

package() {
  cd "$srcdir/$_pkgname"
  ruby=$(test -x /usr/bin/ruby && echo /usr/bin/ruby || which ruby)
  $ruby install.rb --dest-dir "$pkgdir" --prefix /usr --conf-dir /etc
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/"$pkgname"/MIT
}

