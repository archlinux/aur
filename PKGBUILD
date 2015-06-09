# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=sqawk-git
pkgver=20150128
pkgrel=1
pkgdesc="Like Awk but with SQL and table joins"
arch=('i686' 'x86_64')
depends=('sqlite-tcl' 'tcl' 'tcllib')
makedepends=('git')
url="https://github.com/dbohdan/sqawk"
license=('MIT')
source=(git+https://github.com/dbohdan/sqawk)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -dpr --no-preserve=ownership README.md examples "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg 'Installing...'
  install -Dm 755 sqawk.tcl "$pkgdir/usr/bin/sqawk"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
