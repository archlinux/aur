# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=deadbeef-plugin-fb-git
pkgver=v0.5.6.r14.gbc31e3d9
pkgrel=1
pkgdesc="filebrowser plugin for the deadbeef audio player"
url="http://sourceforge.net/projects/deadbeef-fb/"
arch=('i686' 'x86_64')
license='GPL2'
depends=('deadbeef')
makedepends=('git')
source=('deadbeef-fb::git://deadbeef-fb.git.sourceforge.net/gitroot/deadbeef-fb/deadbeef-fb')
md5sums=('SKIP')

pkgver() {
  cd "deadbeef-fb"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd deadbeef-fb
  ./autogen.sh
  ./configure --prefix=/usr --enable-gtk3 --disable-gtk2
  make
}

package() {
  cd deadbeef-fb
  make DESTDIR="$pkgdir" install
}
