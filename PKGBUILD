# Contributor: Severen Redwood <severen@shrike.me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='confmacs-git'
pkgver=r51.bf27611
pkgrel=1
pkgdesc='An Emacs configuration switcher.'
arch=('any')
license=('GPL3')
url='https://github.com/SShrike/confmacs'
makedepends=('git' 'rake' 'ruby-bundler')
depends=('ruby-thor>=0.19.1' 'ruby-colorize>=0.7.3' 'ruby-highline>=1.7.2')
conflicts=('confmacs')
provides=('confmacs')
source=('git+https://github.com/SShrike/confmacs.git')
md5sums=('SKIP')
noextract=("$pkgname.gem")

pkgver() {
  cd ${pkgname%-git}
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname%-git}
  rake build
}

package() {
  cd ${pkgname%-git}
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  echo $pkgdir$_gemdir
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "pkg/${pkgname%-git}.gem"
}
