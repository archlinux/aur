# Maintainer: Anatol Pomozov

pkgname=subtle-git
pkgver=0.11.r21.g7f3b86a
pkgrel=1
pkgdesc='A grid-based manual tiling window manager with a strong focus on easy but customizable look and feel'
arch=(i686 x86_64)
url='http://github.com/anatol/subtle'
license=(GPL)
depends=(ruby libxrandr libxft libxpm libxinerama libxtst)
makedepends=(git pkg-config)
provides=(subtle)
conflicts=(subtle)
backup=(etc/xdg/subtle/subtle.rb)
source=(git+http://github.com/anatol/subtle)
md5sums=('SKIP')

pkgver() {
  cd subtle
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd subtle
  # Use vendor_ruby instead of site_ruby
  sed -e \
    's/RbConfig::CONFIG\["sitelibdir"\]/RbConfig::CONFIG\["vendorlibdir"\]/' \
    -i Rakefile
}

package() {
  cd subtle
  rake destdir="$pkgdir" install
  install -D -m644 data/subtle.desktop "$pkgdir"/usr/share/xsessions/subtle.desktop
}
