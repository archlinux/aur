# Contributor: Berseker < berseker86 at gmail.com >
pkgname=gphotoframe
pkgver=2.0.2
_gitrev=cafe98c74744df0c70d5d375889e4c88f9cdb078
pkgrel=1
pkgdesc="Photo frame gadget for the GNOME Desktop"
arch=('any')
url="https://github.com/iblis17/gphotoframe"
license=('GPL3')
depends=('libchamplain' 'python2-feedparser' 'python2-gobject' 'python2-oauth'
         'python2-pyopenssl' 'python2-twisted' 'python2-xdg' 'webkit2gtk')
makedepends=('gnome-doc-utils' 'python2-distutils-extra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iblis17/gphotoframe/archive/$_gitrev.tar.gz"
        "webkit2.patch")
sha256sums=('19e7c43a817381f8a93249d109c0b062970644cb6f7b069e7e5c1c798b874fb4'
            'be7b536e986b8f55ba8481120dfaff644ee589aa98ea3e0e62649c2c2b5d2891')

prepare() {
  cd $pkgname-$_gitrev
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  patch -Np1 -i ../webkit2.patch
}

build() {
  cd $pkgname-$_gitrev
  python2 setup.py build
}

package() {
  cd $pkgname-$_gitrev
  python2 setup.py install --root "$pkgdir" --optimize=1
}
