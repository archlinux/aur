# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=markdown2ctags
pkgver=0.1.1
pkgrel=1
pkgdesc="Generate ctags-compatible tags files for Markdown documents"
arch=('any')
depends=('python2')
url="https://github.com/jszakmeister/markdown2ctags"
license=('BSD3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jszakmeister/$pkgname/tar.gz/v$pkgver)
sha256sums=('2b1e963075c5f603354bddaaa6c56a5e76a29a923898bb2f958672da3ec65d8f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/markdown2ctags/LICENSE.txt"

  msg 'Installing documentation...'
  install -Dm 644 README.md    "$pkgdir/usr/share/doc/markdown2ctags/README.md"

  msg 'Installing...'
  install -Dm 755 markdown2ctags.py "$pkgdir/usr/bin/markdown2ctags"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
