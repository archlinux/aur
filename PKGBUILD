# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Elkin Cruz <agnelkincc@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=shedskin-git
pkgver=0.9.4.r120.gae88dbca
pkgrel=1
pkgdesc='Experimental (restricted) Python-to-C++ compiler (development version)'
url='https://github.com/shedskin/shedskin'
license=('GPL3')
source=(git+https://github.com/shedskin/shedskin.git)
sha256sums=('SKIP')
arch=('any')
depends=('pcre' 'gc' 'python2')
makedepends=('git')
conflicts=('shedskin')
provides=('shedskin')

pkgver() {
  cd shedskin

  # Get the version number.
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd shedskin

  # Patch Python versions.
  sed -i -e 's/python\b/python2/g' $(grep -rl 'python\b')
}

build() {
  cd shedskin

  # Build it!
  python2 setup.py build
}

package() {
  cd shedskin

  # Install the program.
  python2 setup.py install --root="$pkgdir" --optimize=1
}
