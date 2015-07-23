# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: sssslang <xofyarg at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

# Change to yanyu for experimental content
_branch=master

pkgname=fortune-mod-zh-git
pkgver=1.8.r38.g3a06c3c
pkgrel=1
pkgdesc="Chinese poems for fortune-mod"
url="http://packages.qa.debian.org/f/fortune-zh.html"
license="GPL"
depends=('fortune-mod')
makedepends=('git')
conflicts=('fortune-mod-zh')
source=("git+https://anonscm.debian.org/git/chinese/fortune-zh.git#branch=$_branch")
md5sums=('SKIP')
arch=('i686' 'x86_64')

pkgver() {
  cd fortune-zh
  git describe --long | sed 's#^debian/##;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Fix path in fortune-zh executable
  cd fortune-zh
  sed -i "s|/usr/games/fortune|/usr/bin/fortune|" fortune-zh
}

build() {
  cd fortune-zh
  make
}

package() {
  cd fortune-zh
  make DESTDIR="$pkgdir" FORTUNES=/usr/share/fortune GAMES=/usr/bin install
}
