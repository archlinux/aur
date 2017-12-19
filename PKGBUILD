# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=sjsp-git
pkgver=20150705
pkgrel=1
pkgdesc="Simple JavaScript Profiler"
arch=('i686' 'x86_64')
makedepends=('haskell-stack')
url="https://github.com/itchyny/sjsp"
license=('MIT')
source=(git+https://github.com/itchyny/sjsp)
sha256sums=('SKIP')
options=('strip')
provides=('sjsp')
conflicts=('sjsp')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/bin"
  stack --local-bin-path "$pkgdir/usr/bin" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
