# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=diakonos
pkgver=0.10.0
pkgrel=1
pkgdesc="A Linux console text editor for the masses."
arch=('any')
url="https://git.sr.ht/~pistos/diakonos"
license=('MIT')
depends=('ruby' 'ruby-curses')
makedepends=('git')

source=("git+$url#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  sed -i 's+sitelibdir+vendorlibdir+' install.rb
}

package() {
  cd "$pkgname"
  ruby install.rb --dest-dir "$pkgdir" --prefix /usr --conf-dir /etc
  install -D -m644 LICENCE "$pkgdir"/usr/share/licenses/"$pkgname"/MIT
}

