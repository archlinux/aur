# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

_pkgname=ddcutil
pkgname=ddcutil-git
pkgver=v0.7.2.r0.g02a0433
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB (development version).'
url='http://ddcutil.com/'
license=('GPL')
source=('git+https://github.com/rockowitz/ddcutil')
sha256sums=('SKIP')
arch=('i686' 'x86_64')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Generate the build configuration.
  ./autogen.sh
  # Configure the build.
  ./configure --prefix=/usr

  # Build it!
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  make DESTDIR="${pkgdir}" install
}

# vim: ft=sh ts=2 sw=2 et
