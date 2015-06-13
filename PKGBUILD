# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=python2-regex-hg
pkgver=153.0b2d7bbed01e
pkgrel=1
pkgdesc="Alternative regular expression module, to replace re."
arch=('i686' 'x86_64')
url="https://code.google.com/p/mrab-regex-hg/"
license=('custom')
depends=('python2')
makedepends=('mercurial')
_hgname='mrab-regex-hg'
source=("hg+https://code.google.com/p/$_hgname")
md5sums=(SKIP)

_dist=Python2
_regex=regex_2

pkgver() {
  cd ${_hgname}
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  #cd "$srcdir"
  #if [ -d ${_hgname} ] ; then
  #  cd ${_hgname}
  #  hg pull -u
  #  cd "$srcdir"
  #else
  #  hg clone ${_hgroot}/${_hgname}
  #fi

  #cp -rT ${_hgname} ${_hgname}-build
  #cd ${_hgname}-build/PyPI
  cd ${srcdir}/${_hgname}/PyPI

  if [ ! -d ${_dist} ] ; then
    mkdir ${_dist}
  fi

  if [ ! -d ${_dist}/../docs ] ; then
    mkdir ${_dist}/../docs
  fi

  cp ../docs/Features.rst ${_dist}/../docs
  cp ../${_regex}/regex/* ${_dist}
  cp ../${_regex}/Python/* ${_dist}

  python2 setup.py build
}

package() {

  cd "${srcdir}/${_hgname}/PyPI"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"

}

