# Maintainer:  dacoit <dacoit at tuta.io>
pkgname=tutanota
pkgver=2.5.1
pkgrel=1
pkgdesc='Tutanota end-to-end encrypted email client webapp'
url='https://tutanota.de'
arch=('any')
license=('GPL3')
makedepends=('npm' 'gulp')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz")
md5sums=('ec18ce32e3222775526cb42df22c27ea')

# Set to any value to install a symlink 
# from the document root to the webapp
_doc_root_symlink=
_doc_root="/srv/http"

build() {
  cd "$pkgname-$pkgname-release-$pkgver/web"
  npm install
  gulp dist
}

package() {
  mkdir -p "$pkgdir/usr/share/webapps"
  cp -a "$pkgname-$pkgname-release-$pkgver/web/build" "$pkgdir/usr/share/webapps/$pkgname"
  if [ -n "$_doc_root_symlink" ]; then
      mkdir -p "$pkgdir/$_doc_root"
      ln -s "/usr/share/webapps/$pkgname" "$pkgdir/$_doc_root/$pkgname"
  fi
}
