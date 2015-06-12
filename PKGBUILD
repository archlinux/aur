pkgname=wcgbrowser-git
pkgver=r122.0f8740c
pkgrel=3
pkgdesc="A web browser for kiosk systems."
arch=('any')
url="http://www.alandmoore.com/wcgbrowser/wcgbrowser.html"
license=("GPL")
makedepends=('git')
depends=('python-yaml' 'python-pyqt5' 'qt5-webkit')
source=("git+https://github.com/alandmoore/wcgbrowser.git")
md5sums=('SKIP')
backup=("etc/wcgbrowser.yaml")
_reponame="wcgbrowser"

pkgver() {
  
  cd "${srcdir}"/"${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

  cd "${srcdir}"/"${_reponame}"
  
  # Fix the path in wcgbrowser launch script
  sed -i 's|/usr/local|/usr|' wcgbrowser

}

package(){

  cd "${srcdir}"/"${_reponame}"
  
  # Make directories
  install -dm755 "${pkgdir}"/usr/share/doc/"${_reponame}"/examples
  
  # Copy Files
  install -D -m644 browser.py "${pkgdir}"/usr/share/"${_reponame-}"/browser.py
  install -D -m755 wcgbrowser "${pkgdir}"/usr/bin/wcgbrowser
  install -D -m644 wcgbrowser.yaml "${pkgdir}"/etc/wcgbrowser.yaml
  install -D -m644 README.rst "${pkgdir}"/usr/share/doc/"${_reponame}"/README.rst
  install -m644 examples/* "${pkgdir}"/usr/share/doc/"${_reponame}"/examples/

}
