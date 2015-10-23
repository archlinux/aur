# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>

_gitroot="https://github.com/Diaoul/subliminal"
_gitname="subliminal"
pkgbase=subliminal-git
pkgname=('python-subliminal-git' 'python2-subliminal-git')
pkgver=1.0.1.692.e0788be
pkgrel=1
epoch=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=(MIT)
makedepends=('python2-setuptools' 'python-setuptools')
conflicts=(subliminal)
source=("${_gitname}::git+${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo 1.0.1.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  #git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python-subliminal-git() {
  depends=(
    'python-beautifulsoup4>=4.2.0' 'python-guessit>=0.9.1'
    'python-requests>=2.0' 'python-enzyme>=0.4.1'
    'python-dogpile.cache>=0.5.4' 'python-click>=4.0'
    'python-pysrt>=1.0.1' 'python-six>=1.9.0'
    'python-babelfish>=0.5.2'
    'python-chardet>=2.3.0' 'python-stevedore>=1.0.0'
  )
  provides=(subliminal-git)
  replaces=(subliminal-git)
  cd ${srcdir}/${_gitname}
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/subliminal "${pkgdir}"/usr/bin/subliminal3
  ln -s "${pkgdir}"/usr/bin/subliminal3 "${pkgdir}"/usr/bin/subliminal
}

package_python2-subliminal-git() {
  depends=(
    'python2-beautifulsoup4>=4.2.0' 'python2-guessit>=0.9.1'
    'python2-requests>=2.0' 'python2-enzyme>=0.4.1'
    'python2-dogpile.cache>=0.5.4' 'python2-click>=4.0'
    'python2-pysrt>=1.0.1' 'python2-six>=1.9.0'
    'python2-babelfish>=0.5.2'
    'python2-chardet>=2.3.0' 'python2-stevedore>=1.0.0'
  )
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/subliminal "${pkgdir}"/usr/bin/subliminal2
}
