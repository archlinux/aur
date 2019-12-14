# Maintainer: Sol Bekic <s+aur [at] s-ol [dot] nu>

pkgname=python-leapmotion
pkgver=2.3.1
pkgrel=3
pkgdesc="The Leapmotion python interface, compiled for python 3"
arch=('i686' 'x86_64')
makedepends=('swig3' 'leap-motion-sdk' 'python-setuptools')
depends=('python' 'leap-motion-sdk')
url="https://developer.leapmotion.com/downloads"
license=('unknown')
source=('setup.py' 'fix-interface.patch')
md5sums=('ef0b9321730ef63d62363281b05f453f'
         '8c72050df88146c07998d6bb43f56120')

build() {
  cp /usr/include/Leap{.h,Math.h} .
  patch -i fix-interface.patch /usr/include/Leap.i -o Leap.i
  swig-3 -c++ -python -o LeapPython.cpp -interface LeapPython Leap.i

  LEAP_VERSION="$pkgver" python setup.py build
}

package() {
  LEAP_VERSION="$pkgver" python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
