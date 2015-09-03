# Based on original PKGBUILD: brix <blbennett .. telus . net>
# Maintainer: Klowner <mark@klowner.com>

pkgname=xword
pkgver=2.0.0rc2
pkgrel=1
pkgdesc="Do crossword puzzles in Across Lite format"
arch=('any')
url="https://alioth.debian.org/projects/xword/"
license=('BSD')
depends=('python2' 'pygtk' 'python2-wnck')
source=(http://ftp.de.debian.org/debian/pool/main/x/xword/xword_2.0.0~rc2.orig.tar.gz xword.desktop)
sha1sums=('0409f93f9cf65a5e450b89c81f358545ea268dcf' '06d4b27c61091f0d152e575078ee9d1ed89e1648')

prepare() {
  cd xword-2.0.0~rc2
## uncomment next 4 lines to enable HiDPI (~275 ppi) text display
#  sed -i 's/25/09/' xword/grid.py
#  sed -i 's/45/20/' xword/grid.py
#  sed -i 's/85/39/' xword/grid.py
#  sed -i 's/, 200)/, 400)/' xword/main.py
  sed -i '1s/env python/&2/' scripts/xword
  sed -i '/set_website/d' xword/main.py
  sed -i 's/lambda .args: dialog/lambda dlg,resp: dlg/' xword/main.py
  sed -i '/set_website/d' xword/organizer.py
  sed -i 's/lambda .args: dialog/lambda dlg,resp: dlg/' xword/organizer.py
}

build() {
  cd xword-2.0.0~rc2
  python2 setup.py build
}

package() {
  cd xword-2.0.0~rc2
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -D -m644 PKG-INFO "$pkgdir/usr/share/doc/$pkgname/PKG-INFO"
  install -D -m644 ../xword.desktop "$pkgdir/usr/share/applications/xword.desktop"
  python2 setup.py install --root="${pkgdir}"
}

