# Maintainer: willemw <willemw12@gmail.com>

pkgname=webilder-gtk-patched
pkgver=0.7.3
_pkgver_git_commit_sha=f1add30cebfe8e95c918b1a0ba0ea06299d33821
pkgrel=2
pkgdesc="Deliver stunning wallpapers directly from Flickr and Webshots. Desktop-independent patched version"
url="http://www.webilder.org"
arch=('any')
depends=('pygtk' 'python2-pillow')
makedepends=('git' 'python2-setuptools')
license=('BSD')
provides=('webilder')
source=(webilder-$pkgver::git+https://github.com/thesamet/webilder.git#commit=$_pkgver_git_commit_sha
        setup.py)
md5sums=('SKIP'
         '6ef2767889aeb8c99719e67a72693e19')

prepare() {
  # Patch setup script
  cp setup.py webilder-$pkgver/

  cd webilder-$pkgver
  sed -i "s/^import Image$/from PIL import Image/" src/webilder/flickr/__init__.py
}

package() {
  cd webilder-$pkgver
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

