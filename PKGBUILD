# Maintainer: peippo <christoph.fink@gmail.com>
pkgbase=python-twitter-git
pkgname=('python-twitter-git' 'python2-twitter-git')
pkgver=3.99.r1.c736c47
_pkgver=3.99
pkgrel=1
pkgdesc="A Python wrapper around the Twitter API"
url="https://github.com/bear/python-twitter"
arch=(any)
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests-oauthlib' 'python2-requests-oauthlib' 'python2-future' 'python-future' 'git')
source=("${pkgbase}::git://github.com/bear/python-twitter.git")
md5sums=('SKIP')

pkgver(){
  cd "${pkgbase}"
  printf "%s.r%s" "$_pkgver" "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cp -R "${srcdir}/${pkgbase}" "${srcdir}/${pkgbase}-py2"

  cd "${srcdir}/${pkgbase}"
  python setup.py build

  cd "${srcdir}/${pkgbase}-py2"
  python2 setup.py build
}

package_python-twitter-git() {
  depends=('python-requests-oauthlib' 'python-future')
  provides=('python-twitter')
  conflicts=('python-twitter')

  cd "${srcdir}/${pkgbase}"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-twitter-git() {
  depends=('python2-requests-oauthlib' 'python2-future')
  provides=('python2-twitter')
  conflicts=('python2-twitter')

  cd "${srcdir}/${pkgbase}-py2"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

