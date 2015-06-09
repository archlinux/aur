# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pipe-logger-git
pkgver=20140509
pkgrel=1
pkgdesc="Log rotation of stdout & stderr"
arch=('any')
depends=('bash' 'ruby')
makedepends=('git')
url="https://github.com/junegunn/pipe-logger"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/junegunn/pipe-logger)
sha256sums=('SKIP')
provides=('pipe-logger')
conflicts=('pipe-logger')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/pipe-logger/README.md"

  msg 'Installing...'
  install -Dm 755 pipe-logger "$pkgdir/usr/bin/pipe-logger"
  install -Dm 755 pipe-logger.sh "$pkgdir/usr/bin/pipe-logger.sh"
}
