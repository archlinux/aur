# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor:  Victor Feight <vrfeight3 at gmail dot com>

pkgname=gsimplecal-git
_gitname=gsimplecal
pkgver=2.1_r1_g2dc6bba
pkgrel=1
pkgdesc="Simple and lightweight GTK calendar (git)"
arch=('i686' 'x86_64')
url="http://dmedvinsky.github.com/gsimplecal/"
license=('GPL')
depends=('gtk3')
makedepends=('git')
conflicts=('gsimplecal-hg' 'gsimplecal')
source=(git+'https://github.com/dmedvinsky/gsimplecal.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed -e 's:^v::' -e 's:\([^-]*-g\):r\1:' -e 's:-:_:g'
}

build() {
  cd ${_gitname}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}" install
}
