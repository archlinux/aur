# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=chromeos-apk
pkgname=$_pkgname-git
pkgver=20150616.r125.41fa9ee
pkgrel=1
pkgdesc='Extract Android APKs for running in Chrome OS OR Chrome in OS X, Linux and Windows'
arch=('any')
url='https://github.com/vladikoff/chromeos-apk'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  npm install
  sed -i 's|\./chromeos-apk\.js|/usr/share/chromeos-apk/chromeos-apk\.js|' chromeos-apk
}

package() {
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  cp -r $_pkgname/* "$pkgdir/usr/share/$_pkgname/"
  rm -rf "$pkgdir/usr/share/$_pkgname/.git"
  mv "$pkgdir/usr/share/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  mv "$pkgdir/usr/share/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
