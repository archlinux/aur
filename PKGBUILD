# Maintainer: Daniel Maslowski <info at orangecms dot org>
_gitname=neopg
pkgname=neopg-git
pkgver=0.0.1
pkgrel=1
pkgdesc="The multiversal cryptoengine!"
arch=('i686' 'x86_64')
url="https://github.com/das-labor/neopg"
license=('BSD-2')
depends=('botan' 'zlib' 'sqlite')
makedepends=('git' 'cmake' 'lcov' 'gcovr')
optdepends=('gnutls'
            'bzip2'
            'readline'
            'libusb: For smartcard support')
source=('git://github.com/das-labor/neopg.git')
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
  cd "${srcdir}/${_gitname}/build"
  git submodule update --init
  cmake -DCMAKE_BUILD_TYPE=Release ..

}

build()
{
  cd "${srcdir}/${_gitname}/build"
  make
}

package()
{
  cd "${srcdir}/${_gitname}/build/rc"
  install -Dm 755 neopg "${pkgdir}/usr/bin/neopg"
}
