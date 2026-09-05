#Maintainer: stefonarch standreas@riseup.net

_pkgname=lxqt-panel-tool
pkgname=$_pkgname-git
pkgver=0.1.r0.ga0aa018
pkgrel=1
pkgdesc="Save and switch configurations of lxqt-panel"
arch=('any')
url="https://github.com/stefonarch/lxqt-panel-tool"
license=(' GPL 2.0+')
depends=('lxqt-panel' 'python-pyqt6' 'qt6-tools')
makedepends=('git')
provides=("${pkgname}=${pkgver}")
source=("git+https://github.com/stefonarch/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  # Install main script
  install -Dm755 lxqt-panel-tool.sh "$pkgdir/usr/bin/lxqt-panel-tool"

  # Install desktop file
  install -Dm644 lxqt-panel-tool.desktop "$pkgdir/usr/share/applications/lxqt-panel-tool.desktop"

  # Install files
  install -d "$pkgdir/usr/share/lxqt-panel-tool"
  cp -a lxqt-panel-tool/* "$pkgdir/usr/share/lxqt-panel-tool/"
  }
