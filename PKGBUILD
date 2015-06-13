# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgname=dropbox-index
pkgver=0.4.3
pkgrel=4
pkgdesc="Creates index.html for directory contents shared publicly on Dropbox. That way you can easily share whole content of the directory without the need to send separate links for all the shared files. "
arch=('any')
url=('http://code.google.com/p/kosciak-misc/wiki/DropboxIndex')
license=('Apache')
depends=('python' 'dropbox')
makedepends=('subversion')
conflicts=('dropbox-index-svn')
source=('use_python3.patch' 
	"http://pypi.python.org/packages/source/d/dropbox-index/dropbox-index-${pkgver}.tar.gz")
md5sums=('64c39149c591419d8cb0d98aa47fb840'
         '17af3dc3983770287237f49551c98341')

package() {
  cd $srcdir/$pkgname-$pkgver
  (
	cd dropbox_index
	patch  -Np1 < ../../use_python3.patch
  )
  install -Ddm755 $pkgdir/usr/bin
  install -Ddm755  $pkgdir/usr/lib/$pkgname
  cp -r "icons/" "$pkgdir/usr/lib/$pkgname"
  install -Dm655 template-example.html $pkgdir/usr/lib/$pkgname/template-example.html
  install -Dm755 dropbox_index/__init__.py $pkgdir/usr/lib/$pkgname/__init__.py
  # symlink to bin folder
  ln -s /usr/lib/$pkgname/__init__.py $pkgdir/usr/bin/$pkgname
}
