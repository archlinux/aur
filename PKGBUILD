# Maintainer: Sascha Shaw <sascha.shaw@t-online.de>

pkgname=('python-odfpy-git' 'python2-odfpy-git' 'odfpy-git')
pkgbase='odfpy-git'
pkgver=1.3.3
pkgrel=2
arch=('any')
url="https://github.com/eea/${pkgbase%-git}"
license=('GPL')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgbase%-git}"
  python2 setup.py build
  python setup.py build
}

package_python-odfpy-git() {
  pkgdesc='A python library for manipulating OpenDocument 1.2 files'
  depends=('python')
  conflicts=('python-odfpy' 'python2-odfpy' 'odfpy')

  cd "${srcdir}/${pkgbase%-git}"
  python setup.py install --root="${pkgdir}/" --skip-build
  rm -rf ../tools-{bin,share}
  mv "${pkgdir}"/usr/bin ../tools-bin
  mv "${pkgdir}"/usr/share ../tools-share
}

package_python2-odfpy-git() {
  pkgdesc='A python2 library for manipulating OpenDocument 1.2 files'
  depends=('python2')
  conflicts=('python2-odfpy' 'odfpy')

  cd "${srcdir}/${pkgbase%-git}"
  python2 setup.py install --root="${pkgdir}/" --skip-build
  rm -rf "${pkgdir}"/usr/bin
  rm -rf "${pkgdir}"/usr/share
}

package_odfpy-git() {
  pkgdesc='Tools for manipulating OpenDocument 1.2 files'
  depends=('python-odfpy-git')

  install -Dt "${pkgdir}"/usr/bin/ "${srcdir}"/tools-bin/*
  install -Dt "${pkgdir}"/usr/share/man/man1/ "${srcdir}"/tools-share/man/man1/*
}

# vim:set ts=2 sw=2 et:
