# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgbase=pygobject-tutorial-git
pkgname=('pygobject-tutorial-git' 'pygobject-tutorial-devhelp-git')
pkgver=r229.db51eb6
pkgrel=1
pkgdesc="The PyGObject Tutorial in html format."
arch=('any')
url="https://github.com/sebp/PyGObject-Tutorial"
license=('FDL1.3')
makedepends=('git' 'python-sphinx' 'python-sphinx_rtd_theme')
source=("${pkgbase%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "${pkgbase%-git}"
  make html
  make devhelp
}

package_pygobject-tutorial-git() {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  install -d ${pkgdir}/usr/share/doc/python-gobject-tutorial
  cd "${pkgbase%-git}"
  cp -a build/html ${pkgdir}/usr/share/doc/python-gobject-tutorial/
}

package_pygobject-tutorial-devhelp-git() {
  pkgdesc="The PyGObject Tutorial for GNOME devhelp."
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  install -d ${pkgdir}/usr/share/devhelp/books/PythonGTK3Tutorial
  cd "${pkgbase%-git}"
  cp -a build/devhelp/* ${pkgdir}/usr/share/devhelp/books/PythonGTK3Tutorial/
}
# vim:set ts=2 sw=2 et:w

