# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=git-crypt-git
pkgver=20131230
pkgrel=1
pkgdesc="Transparent file encryption in Git"
arch=('i686' 'x86_64')
makedepends=('gcc' 'git' 'make' 'openssl')
url="http://www.agwa.name/projects/git-crypt/"
license=('GPL3')
source=(git+https://github.com/AGWA/git-crypt)
sha256sums=('SKIP')
provides=('git-crypt')
conflicts=('git-crypt')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  mkdir -p "${pkgdir}/usr/bin"
  make PREFIX="$pkgdir/usr" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
