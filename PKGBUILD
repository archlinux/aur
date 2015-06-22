# Maintainer: Lubosz Sarnecki <lubosz at gmail com>

pkgname=django-haystack-git
pkgver=20120918
pkgrel=1
pkgdesc="Modular search for Django."
arch=(any)
url="http://haystacksearch.org/"
license=('MIT')
depends=('python' 'django')
optdepends=('python2-pysolr-git: solr backend')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/toastdriven/django-haystack.git"
_gitname="django-haystack"

build() {
  msg "Connecting to github...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot}
  fi

  msg "git clone done."
  
  if [[ -d ${srcdir}/${_gitname}-build ]]; then
    msg "Cleaning the previous build directory..." 
    rm -rf ${srcdir}/${_gitname}-build
  fi

  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  cd ${srcdir}/${_gitname}-build
  
	python2 setup.py build || return 1
}

package() {
	cd ${srcdir}/${_gitname}-build
	python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
