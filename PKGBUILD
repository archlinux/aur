# Maintainer: Harrison Thorne <harrison.thorne@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Xander van der Goot <xandervandergoot@gmail.com>

pkgname=hledger-git
pkgver=20191113
pkgrel=2
pkgdesc="The hledger command-line and web-based accounting tool"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('git' 'stack')
url="http://hledger.org"
license=('GPL3')
options=('strip')
source=(git+https://github.com/simonmichael/hledger)
sha256sums=('SKIP')
provides=('hledger' 'hledger-ui' 'hledger-web')
conflicts=('hledger' 'hledger-ui' 'hledger-web')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/hledger"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/bin"
  stack --local-bin-path "$pkgdir/usr/bin" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
