# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=subtle-git
pkgver=0.11.r21.g7f3b86af
pkgrel=1
pkgdesc='A grid-based manual tiling window manager.'
arch=(i686 x86_64)
url='http://hg.subforge.org/subtle'
license=(GPL)
depends=(ruby libxrandr libxft libxpm libxinerama libxtst ruby-rake)
makedepends=(mercurial pkg-config)
provides=(subtle)
conflicts=(subtle)
backup=(etc/xdg/subtle/subtle.rb)
source=(hg+http://hg.subforge.org/subtle)
md5sums=('SKIP')

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
