# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=snis-git
pkgver=2545.b01de0d
pkgrel=1
pkgdesc="Space Nerds in Space open source spaceship bridge simulator."
arch=('i686' 'x86_64')
url="http://smcameron.github.io/space-nerds-in-space/"
license=('GPL2')
depends=('gtkglext' 'lua' 'portaudio')
makedepends=('git' 'openscad' 'sdl')
optdepends=('sdl: for using mesh_viewer')
provides=('snis' 'ssgl' 'ssgl-git')
conflicts=('snis')
source=("$pkgname::git://github.com/smcameron/space-nerds-in-space.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {  
  cores=`nproc`
  cd "$srcdir/$pkgname"
  make -j "$cores" PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir "$pkgdir/usr"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/share/applications/mimeinfo.cache"
}
