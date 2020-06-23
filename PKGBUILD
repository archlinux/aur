# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=editorconfig-gedit-git
pkgver=0.5.3.r195.ga7190f7
pkgrel=1
pkgdesc="EditorConfig plugin for gedit"
arch=('any')
url="https://editorconfig.org/"
license=('BSD')
depends=('gedit' 'python-editorconfig')
makedepends=('git')
provides=('editorconfig-gedit')
conflicts=('editorconfig-gedit')
source=("git+https://github.com/editorconfig/editorconfig-gedit.git")
sha256sums=('SKIP')


pkgver() {
  cd "editorconfig-gedit"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "editorconfig-gedit"

  _installdir="$pkgdir/usr/lib/gedit/plugins"
  install -d "$_installdir"

  cp -r "editorconfig_plugin/" "$_installdir"
  install "editorconfig.plugin" -t "$_installdir"
  install "editorconfig_gedit3.py" -t "$_installdir"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/editorconfig-gedit"
}
