# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=python2-pygame
pkgver=2.0.3
pkgrel=2
pkgdesc="Python game library"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.pygame.org/"
license=('LGPL')
depends=('sdl2_mixer' 'sdl2_ttf' 'sdl2_image' 'python2' 'portmidi')
makedepends=('python2-setuptools' 'sdl2')
source=("https://pypi.io/packages/source/p/pygame/pygame-$pkgver.tar.gz")
sha256sums=('d097f2802a9d0d7fb40c49c789af2984b202baa8fd32701082598755f5973f51')

prepare() {
  cd pygame-${pkgver}
  # don't ship compiled bytecode from upstream
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
  cp -R examples "${pkgdir}"/usr/lib/python2.7/site-packages/pygame

# Fixing permissions
  chmod 644 "${pkgdir}"/usr/include/python2.7/pygame/*
}
