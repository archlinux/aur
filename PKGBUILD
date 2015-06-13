# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: robb_force <robb_force@holybuffalo.net>
# Contributor: Anton Shestakov <engored*ya.ru>

pkgname=wahcade
pkgver=0.99pre8
pkgrel=4
pkgdesc="Wah!Cade, Front-end software for arcade cabinets"
arch=('any')
url="http://www.anti-particle.com/wahcade.shtml"
license=('GPL')
depends=('pygtk' 'python2-chardet')
optdepends=('pil: required for image rotation in layouts'
            'gstreamer0.10: required for video & music playback'
            'python2-pygame: required for joystick support')
source=("http://www.anti-particle.com/projects/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('88873138a885cdab832e5af67863c945')

prepare() {
  cd "$srcdir/$pkgname"

# Set scripts to run with python2
  find -name '*.py' -exec sed -i 's/env python$/python2/' {} \;
  sed -i 's/python/python2/g' install

# Adjust install script for installing to pkgdir
  sed -e '/\/usr\/share\/applications/d' \
      -e "s|PREFIX=/usr/local|PREFIX=$pkgdir/usr|" \
      -e 's|cd ${DESTDIR}|cd /usr/share/${NAME}|g' \
      -e 's|/usr/share/pixmaps|$PREFIX/share/pixmaps|g' \
      -i install
}

package() {
  cd "$srcdir/$pkgname"
  
# Create directories for the install script
  install -d "$pkgdir/usr/"{bin,share/pixmaps}

  ./install
}

