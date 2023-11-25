# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=python-pybuilder
pkgver=0.13.10
pkgrel=1
pkgdesc='An extensible, easy to use continuous build tool for Python'
arch=('any')
url='https://pybuilder.github.io'
license=('Apache')
# added dependencies of distutils plugin into pybuilder's depends
depends=('python-pip' 'python-pypandoc' 'python-tailer' 'python-tblib' 'python-twine' 'python-wheel')
makedepends=('python-cram' 'flake8' 'python-sphinx' 'python-pdoc' 'python-coverage'
             'python-pytddmon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pybuilder/pybuilder/archive/v$pkgver.tar.gz")
sha512sums=('97d325a55142a791ce8c54007585593d2a4661dbd8b8e55a676281163759d779c37bdf45dbc8a7004402703901367ac3dc3ab084c4247bcdce754f40ac4d0d2a')

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
