# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=python2-pygame
pkgver=1.9.6
pkgrel=1
pkgdesc="Python game library"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="http://www.pygame.org/"
license=('LGPL')
depends=('sdl_mixer' 'sdl_ttf' 'sdl_image' 'python2' 'portmidi')
makedepends=('python2-setuptools')
source=(https://pypi.io/packages/source/p/pygame/pygame-$pkgver.tar.gz)
sha256sums=('301c6428c0880ecd4a9e3951b80e539c33863b6ff356a443db1758de4f297957')

prepare() {
  cd pygame-${pkgver}
  # don't ship python2 *and* python3 compiled bytecode from upstream
  find . -name "*.pyc" -delete
  find . -type f -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#' {} +
}

build() {
  cd pygame-${pkgver}
  python2 setup.py build
}

package_python2-pygame() {
  cd pygame-${pkgver}
  python2 setup.py install --root="${pkgdir}" --prefix=/usr

# Copying the examples
  cp -R examples "${pkgdir}/usr/lib/python2.7/site-packages/pygame"

# Fixing permissions
  chmod 644 "${pkgdir}"/usr/include/python2.7/pygame/*
}
