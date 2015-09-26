# Maintainer: Serge Victor <arch@random.re>
# Ex-Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Christos Nouskas <nous at archlinux dot us>

pkgname=vanitygen-git
pkgver=20121024
pkgrel=2
pkgdesc="Bitcoin vanity address generator written in C"
arch=('i686' 'x86_64')
depends=('openssl' 'pcre')
makedepends=('git')
url="https://github.com/samr7/vanitygen"
license=('AGPL3')
source=(git+https://github.com/samr7/vanitygen)
sha256sums=('SKIP')
provides=('vanitygen')
conflicts=('vanitygen')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package_vanitygen-git() {
  cd ${pkgname%-git}

  msg 'Building...'
  make most

  msg 'Installing executables...'
  install -D -m755 vanitygen $pkgdir/usr/bin/vanitygen
  install -D -m755 keyconv $pkgdir/usr/bin/keyconv

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
