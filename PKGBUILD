# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase='python-anyconfig'
pkgname=('python-anyconfig-git' 'python2-anyconfig-git')
pkgver=0.9.11.r0.ga24c2c2
pkgrel=1
pkgdesc='Generic access to configuration files in any formats (to be in the future)'
url='https://github.com/ssato/python-anyconfig'
arch=('any')
license=('MIT')
provides=('python-anyconfig' 'python2-anyconfig')
conflicts=('python-anyconfig' 'python2-anyconfig')
makedepends=('python'
             'python-setuptools'
             'python2'
             'python2-setuptools')
checkdepends=('python-tox')
source=("${pkgname%-git}::git+https://github.com/ssato/python-anyconfig")
sha256sums=('SKIP')

pkgver() {
  cd python-anyconfig
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/RELEASE_//'
}

build() {
  cd python-anyconfig
  python setup.py build
  python2 setup.py build
}

package_python-anyconfig-git() {
  depends=('python')
  cd python-anyconfig
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/python-anyconfig-git/LICENSE"
}

package_python2-anyconfig-git() {
  depends=('python2')
  cd python-anyconfig
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  mv "${pkgdir}/usr/bin/anyconfig_cli" "${pkgdir}/usr/bin/anyconfig_cli2"
  mv "${pkgdir}/usr/share/man/man1/anyconfig_cli.1" "${pkgdir}/usr/share/man/man1/anyconfig_cli2.1"
  install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/python2-anyconfig-git/LICENSE"
}
# vim:set ft=sh ts=2 sw=2 et: