# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgbase='python-debian-git'
_pkgbase='python-debian'
pkgname=('python-debian-git' 'python2-debian-git')
pkgver='0.1.28'
pkgrel=1
pkgdesc="Python modules to work with Debian-related data formats"
arch=('any')
url="http://packages.debian.org/sid/python-debian"
license=('GPL')
makedepends=('python-pip' 'python2-pip')
options=('!emptydirs')
source=('git://anonscm.debian.org/pkg-python-debian/python-debian.git')
sha256sums=('SKIP')

prepare(){
  cd "${srcdir}/${_pkgbase}"
  sed -i 's/__CHANGELOG_VERSION__/0.1.28/g' setup.py.in && cp setup.py.in setup.py
}

package_python-debian-git() {
  depends=('python-chardet' 'python-six')
  optdepends=("python-apt: interface to libapt-pkg")
  conflicts=('python-debian')
  cd "${srcdir}/${_pkgbase}"

  PIP_CONFIG_FILE=/dev/null pip3 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}

package_python2-debian-git() {
  depends=('python2-chardet' 'python2-six')
  optdepends=("python2-apt: interface to libapt-pkg")
  conflicts=('python2-debian')
  cd "${srcdir}/${_pkgbase}"
  PIP_CONFIG_FILE=/dev/null pip2 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
