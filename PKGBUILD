pkgname=openmodelica-dev-omlibraries
pkgver=1.13.0
pkgrel=1

pkgdesc="The Open Source Modelica Suite - A collection of Modelica libraries for use with OpenModelica."
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica-dev)

_group=OpenModelica
_name=OMLibraries
_commit=72007b8017c906efc7028eea0ac44af09a0b0d68

depends=('openmodelica-omc')

makedepends=('git' 'subversion' 'python' 'python-requests' 'python-simplejson' 'python-joblib' 'perl-xml-xpath')

provides=('openmodelica-omlibraries')
conflicts=('openmodelica-dev' 'openmodelica-omlibraries' 'openmodelica-git')

source=(  "git+https://github.com/${_group}/${_name}.git#commit=${_commit}")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/$_name"
  git checkout "${_commit}"
}

build() {
  cd "$srcdir/$_name"
  make
}

package() {
  cd "$srcdir/$_name/build"
  mkdir -p ${pkgdir}/usr/lib/omlibrary
  cp -r * ${pkgdir}/usr/lib/omlibrary
}
