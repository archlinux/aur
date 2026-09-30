pkgname=gnome-shell-extension-hide-activities-git
_pkgname=${pkgname%-git}
pkgver=51.r9.ge2af8a6
pkgrel=1
pkgdesc="A simple GNOME Shell extension to hide the Activities button from the status bar"
arch=('any')
url="https://github.com/zeten30/HideActivities"
license=('Unlicense')
depends=('gnome-shell')
makedepends=('git' 'zip')
source=("${_pkgname}::git+https://github.com/zeten30/HideActivities")
md5sums=('SKIP')
_extdir="usr/share/gnome-shell/extensions/Hide_Activities@shay.shayel.org"

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$_pkgname"
  make release
}

package() {
  cd "$srcdir/$_pkgname/build"
  install -d "$pkgdir/${_extdir}"
  unzip "*.zip" -d "$pkgdir/${_extdir}"
}
