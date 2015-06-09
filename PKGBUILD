# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff-git
pkgver=20141214
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
makedepends=('git')
url="https://github.com/jeffkaufman/icdiff"
license=('PSFL')
source=(git+https://github.com/jeffkaufman/icdiff)
sha256sums=('SKIP')
provides=('icdiff')
conflicts=('icdiff')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/icdiff/README.md"

  msg 'Installing executables...'
  for _bin in git-icdiff icdiff; do
    install -Dm 755 $_bin "$pkgdir/usr/bin/$_bin"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
