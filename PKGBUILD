# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=python-pybuilder
pkgver=0.13.3
pkgrel=1
pkgdesc='An extensible, easy to use continuous build tool for Python'
arch=('any')
url='https://pybuilder.github.io'
license=('Apache')
# added dependencies of distutils plugin into pybuilder's depends
depends=('python-pip' 'python-pypandoc' 'python-tailer' 'python-tblib' 'python-twine' 'python-wheel')
makedepends=('python-cram' 'flake8' 'python-sphinx' 'python-pdoc' 'python-coverage'
             'python-pytddmon' 'python-unittest-xml-reporting')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pybuilder/pybuilder/archive/v$pkgver.tar.gz")
sha512sums=('0a6d9470b9ebe70e7a4bdc860fbf9eeaeb8e7ae2bf1157467ef560a051a74165bc5668d3c370c6da08514e72d559c4376177f23a433947252ac7e47dec0cdac9')

prepare() {
  cd pybuilder-$pkgver
  sed -i 's/"install_dependencies", //' setup.py
  sed -i 's/project.plugin_depends_on("pypandoc", ".*$/project.plugin_depends_on("pypandoc")/' src/main/python/pybuilder/plugins/python/distutils_plugin.py
}

check() {
  cd pybuilder-$pkgver
  python build.py -v analyze || warning "ignoring flake8 warnings"
}

package() {
  cd pybuilder-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
