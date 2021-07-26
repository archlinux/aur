# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=snis-git
pkgver=5300.10f8da8f
pkgrel=1
pkgdesc="Space Nerds in Space open source spaceship bridge simulator."
arch=('i686' 'x86_64')
url="https://smcameron.github.io/space-nerds-in-space/"
license=('GPL2')
depends=('glew' 'sdl2' 'lua52' 'portaudio' 'libbsd')
makedepends=('git' 'desktop-file-utils' 'wget' 'libpng')
optdepends=('espeak: for text to speech'
            'espeak-ng: for text to speech')
provides=('snis' 'ssgl' 'ssgl-git')
conflicts=('snis')
source=("$pkgname::git://github.com/smcameron/space-nerds-in-space.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  make PREFIX="/usr"
  make update-assets
}

package() {
  cd "$srcdir/$pkgname"
  mkdir "$pkgdir/usr"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  make PREFIX="/usr" DESTDIR="$pkgdir" install-assets
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
}
