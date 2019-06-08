pkgname=openmodelica-omlibraries
pkgver=1.13.2
pkgrel=1

pkgdesc="The Open Source Modelica Suite - A collection of Modelica libraries for use with OpenModelica."
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica)

_group=OpenModelica
_name=OMLibraries
_commit=eff6efaa31937b27912edebbf608a4a34b50d8c2

depends=('openmodelica-omc')

makedepends=('git' 'subversion' 'python' 'python-requests' 'python-simplejson' 'python-joblib' 'perl-xml-xpath')

conflicts=('openmodelica-dev' 'openmodelica-dev-omlibraries' 'openmodelica-git')

source=(  "git+https://github.com/${_group}/${_name}.git#commit=${_commit}"
          "Makefile.libs.patch")
sha1sums=('SKIP'
          "2e680f70a6cae244a9ba7d68d1b3c1a1ec54e05a")

prepare() {
  cd "$srcdir/$_name"
  git checkout "${_commit}"
  patch Makefile.libs ../../Makefile.libs.patch
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
