# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor:  Sky <sky at gfw dot party>

_pkgname=deepin-picker
pkgname=$_pkgname-git
pkgver=r88.9f098ac
pkgrel=1
pkgdesc='Color picker tool for deepin'
arch=('any')
url="https://github.com/manateelazycat/deepin-picker"
license=('GPL3')
depends=('deepin-qt5integration' 'qt5-svg')
makedepends=('qt5-tools' 'git' 'deepin-gettext-tools')
groups=('deepin-extra')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+https://github.com/manateelazycat/deepin-picker.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake-qt5 PREFIX=/usr
  make
}

package(){
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
