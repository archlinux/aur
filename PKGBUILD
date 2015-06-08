# Maintainer: willemw <willemw12@gmail.com>

pkgname=webilder-gtk-patched
pkgver=0.7.3
_pkgver_git_commit_sha=f1add30cebfe8e95c918b1a0ba0ea06299d33821
pkgrel=1
pkgdesc="Deliver stunning wallpapers directly from Flickr and Webshots. Desktop-independent patched version"
url="http://www.webilder.org"
arch=('any')
depends=('desktop-file-utils' 'python2-pillow')
makedepends=('python2-setuptools')
license=('BSD')
provides=('webilder')
conflicts=('webilder-applet' 'webilder-gnome')
install=$pkgname.install
#source=(http://www.webilder.org/static/downloads/Webilder-$pkgver.tar.gz
source=(git://github.com/thesamet/webilder.git#commit=$_pkgver_git_commit_sha
        setup.py)
md5sums=('SKIP'
         '6ef2767889aeb8c99719e67a72693e19')

prepare() {
  # Patch setup script
  #cp setup.py webilder-$pkgver/
  cp setup.py webilder/

  #cd webilder-$pkgver
  cd webilder
  sed -i "s|^import Image$|from PIL import Image|" src/webilder/flickr/__init__.py
}

package() {
  #cd webilder-$pkgver
  cd webilder
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

