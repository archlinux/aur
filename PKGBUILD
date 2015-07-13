# Maintainer: Severen Redwood <severen.redwood@gmail.com>

_gemname=confmacs
pkgname=confmacs-git
pkgver=20.f27121f
pkgrel=1
pkgdesc="An Emacs configuration switcher."
arch=('any')
license=('GPL3')
url='https://github.com/SShrike/confmacs'
makedepends=('git' 'ruby')
depends=('ruby-thor>=0.19.1' 'ruby-colorize>=0.7.3' 'ruby-highline>=1.7.2')
conflicts=('confmacs')
provides=('confmacs')
source=("git+https://github.com/SShrike/confmacs.git")
md5sums=('SKIP')
noextract=("$pkgname.gem")

pkgver() {
  cd "confmacs"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "confmacs"
  rake build
  cd pkg
  mv *.gem $pkgname.gem
}

package() {
  cd "confmacs"
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  echo $pkgdir$_gemdir
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "./pkg/$pkgname.gem"
}
