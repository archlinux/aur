# Maintainer: Nikola Milinković <nikmil@gmail.com>

pkgbase=python2-guessit-git
pkgname=('python2-guessit-git' 'python-guessit-git')
pkgver=0.11.1.r940.4993486
pkgrel=1
_gitname="guessit"
_gitroot="git+https://github.com/wackou/guessit"
pkgdesc="A library for guessing information from video files."
arch=(any)
url="https://github.com/wackou/guessit"
license=('LGPL3')
makedepends=('git' 'python2-setuptools' 'python-setuptools')
source=("${_gitname}::${_gitroot}")
md5sums=('SKIP')

pkgver () {
  cd ${_gitname}
  printf "0.11.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python2-guessit-git() {
  depends=(
    'python2-babelfish>=0.5.4' 'python2-stevedore>=1.0.0'
    'python2-requests>=2.0' 'python2-dateutil>=2.1'
  )
  conflicts=('python2-guessit')
  provides=('python2-guessit=${pkgver}')
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "${pkgdir}/usr/bin/guessit" "${pkgdir}/usr/bin/guessit2"
}

package_python-guessit-git() {
  depends=(
    'python-babelfish>=0.5.4' 'python-stevedore>=1.0.0'
    'python-requests>=2.0' 'python-dateutil>=2.1'
  )
  conflicts=('python-guessit')
  provides=('python-guessit=${pkgver}')
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  mv "${pkgdir}/usr/bin/guessit" "${pkgdir}/usr/bin/guessit3"
  ln -s "${pkgdir}/usr/bin/guessit3" "${pkgdir}/usr/bin/guessit"
}
