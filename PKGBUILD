pkgname=kilauncher-git
pkgver=r55.0d424f5
pkgrel=2
pkgdesc="A full-screen tabbed program launcher for kiosk systems."
arch=('any')
url="http://www.alandmoore.com/kilauncher/kilauncher.html"
license=("GPL")
makedepends=('git')
depends=('python-yaml' 'python-pyqt5' 'python-xdg')
source=("git+https://github.com/alandmoore/kilauncher.git")
md5sums=('SKIP')
backup=("etc/kilauncher/kilauncher.yaml")
_reponame="kilauncher"

pkgver() {
  
  cd "${srcdir}"/"${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

  cd "${srcdir}"/"${_reponame}"

  # change the path in the launcher script

  sed -i 's|/usr/local|/usr|' kilauncher

}

package(){

  cd "${srcdir}"/"${_reponame}"
  
  # Make directories
  install -dm755 "${pkgdir}"/usr/share/doc/"${_reponame}"/extras
  
  # Copy Files
  # /usr/share/kilauncher
  install -D -m644 kilauncher.py "${pkgdir}"/usr/share/"${_reponame}"/kilauncher.py
  install -m644 stylesheet.css  "${pkgdir}"/usr/share/"${_reponame}"
  install -m644 tile.png "${pkgdir}"/usr/share/"${_reponame}"

  # /usr/bin
  install -D -m755 kilauncher "${pkgdir}"/usr/bin/kilauncher

  # /etc/kilauncher
  install -D -m644 kilauncher.yaml "${pkgdir}"/etc/kilauncher/kilauncher.yaml

  # /usr/share/doc
  install -D -m644 README.rst "${pkgdir}"/usr/share/doc/"${_reponame}"/README.rst
  install -m644 COPYING "${pkgdir}"/usr/share/doc/"${_reponame}"/COPYING
  install -m644 extras/* "${pkgdir}"/usr/share/doc/"${_reponame}"/extras/

}
