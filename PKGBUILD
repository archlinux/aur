# Contributor: Michael Walker <mike@barrucadu.co.uk>
pkgname=linode-api-python-git
pkgver=20110619
pkgrel=1
pkgdesc="Linode API bindings for Python 2.7"
arch=(any)
url="https://github.com/tjfontaine/linode-python"
license=('BSD')
depends=(python2)
makedepends=('git')
optdepends=('python-pycurl: For verification of SSL keys')
_gitroot="https://github.com/tjfontaine/linode-python.git"
_gitname="linode-python"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  cd "$_gitname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --skip-build

  rm -r build/
}