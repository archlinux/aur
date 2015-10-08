# Maintainer: Taomach <adresatt@gmail.com>
pkgname=python-stfio-git
_realname=stfio
pkgver=v0.13.12macports.r353.g0ebd6e3
pkgrel=1
pkgdesc="Python module for reading and writing data in common electrophysiology formats from Stimfit project."
arch=('i686' 'x86_64' 'armv7h')
url="http://www.stimfit.org"
license=('GPLv2')
depends=('hdf5' 'python-numpy' 'swig')
makedepends=('python' 'git' 'boost')

source=('stfio::git+https://github.com/neurodroid/stimfit.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_realname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_realname"

  msg "Starting make..."
  sh ./autogen.sh
  mkdir -p build/module
  cd build/module
  ../../configure --enable-module --prefix=/usr
  
  msg "Starting make..."
  make
}

package() {
  cd "$srcdir/$_realname/build/module"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
