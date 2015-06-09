# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Elkin Cruz <agnelkincc@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

_pkgname=shedskin
pkgname=shedskin-git
pkgver=latest
pkgrel=1
pkgdesc='Experimental (restricted) Python-to-C++ compiler (development version)'
url='http://code.google.com/p/shedskin/'
license=('GPL3')
source=("${_pkgname}::git+https://gitorious.org/shedskin/mainline.git")
sha256sums=('SKIP')
arch=('any')
depends=('pcre' 'gc' 'python2')
makedepends=('git' 'python2')
conflicts=('shedskin')
provides=('shedskin')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Patch Python versions.
  sed -i -e 's/python\b/python2/g' $(grep -rl 'python\b')
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Build it!
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  python2 setup.py install \
    --root="${pkgdir}" \
    --prefix=/usr
}

# vim: ft=sh ts=2 sw=2 et
