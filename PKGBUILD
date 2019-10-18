# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=python-cheetah3-git
_name=Cheetah3
_reponame=cheetah3
pkgver=3.2.4.r2.g1d7bb27
pkgrel=1
pkgdesc="A Python 3-powered template engine and code generator"
arch=(x86_64)
url="http://www.cheetahtemplate.org"
license=(MIT)
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=('python-markdown')
conflicts=('python-cheetah3')
source=("${_reponame}::git+https://github.com/CheetahTemplate3/${_reponame}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_reponame}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_reponame}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_reponame}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Avoid conflict with python2-cheetah
  for name in cheetah cheetah-analyze cheetah-compile; do
    mv "${pkgdir}/usr/bin/${name}"{,3}
  done
}
