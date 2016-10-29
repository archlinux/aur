# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: dacoit <dacoit at tuta dot io>

pkgname=tutanota
pkgver=2.12.0
pkgrel=1
pkgdesc='Tutanota is the end-to-end encrypted mail client that enables you to communicate securely with anyone.'
url='https://tutanota.de'
arch=('any')
license=('GPL3')
makedepends=(npm gulp)
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz")
sha1sums=('7a06a748f06f233f0e4e506899c66c76feb887aa')

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
