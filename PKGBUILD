# Maintainer: aksr <aksr at t-com dot me>
pkgname=keysnail-git
_pkgname=keysnail
pkgver=0.r1134.0cba175
pkgrel=1
pkgdesc="An add-on that provides comfortable browsing experience for Emacs users, but its target users are not limited to."
arch=('any')
url="https://github.com/mooz/keysnail"
license=('MIT')
groups=()
depends=("firefox>=3.5")
makedepends=('git')
optdepends=()
provides=('keysnail')
conflicts=('keysnail')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/mooz/keysnail.git")
noextract=()
md5sums=('SKIP')


pkgver() {
  cd $srcdir/$pkgname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  ./createpackage.sh
}

package() {
  cd $srcdir/$pkgname
  local _extension_id="keysnail@mooz.github.com"
  local _path_install="$pkgdir/usr/lib/firefox/browser/extensions/$_extension_id/"
  local _path_xpi="$srcdir/$pkgname/$_pkgname"
  install -d "$_path_install"
  unzip  -od "$_path_install" "${_path_xpi}.xpi"
}

