# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=python-libarchive-c-git
pkgname=('python-libarchive-c-git' 'python2-libarchive-c-git')
pkgver=2.4.120.36859c9
pkgrel=1
pkgdesc='Python interface to libarchive'
url='https://github.com/Changaco/python-libarchive-c'
arch=('any')
license=('CC0')
makedepends=('git' 'python-setuptools' 'python2-setuptools' 'libarchive')
checkdepends=('python-pytest-cov' 'python2-pytest-cov')
source=(${pkgbase}::git+https://github.com/Changaco/python-libarchive-c)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ${pkgbase}
  LC_CTYPE=en_US.UTF-8 py.test
  LC_CTYPE=en_US.UTF-8 py.test2
}

package_python-libarchive-c-git() {
  depends=('python' 'libarchive')
  provides=('python-libarchive-c')
  conflicts=('python-libarchive-c')
  cd ${pkgbase}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python2-libarchive-c-git() {
  depends=('python2' 'libarchive')
  provides=('python2-libarchive-c')
  conflicts=('python2-libarchive-c')
  cd ${pkgbase}
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
