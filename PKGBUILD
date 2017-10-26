# Maintainer: Ethan Zonca <e@ethanzonca.com>

pkgname='cannelloni-git'
pkgdesc='SocketCAN over ethernet tunnel'
pkgver=0.1
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/mguentner/cannelloni'
license=('gpl2')
depends=('')
makedepends=('cmake')

source=('git+https://github.com/mguentner/cannelloni.git')
sha512sums=('SKIP')



build() {
  cd "${srcdir}/cannelloni"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}



package() {
  cd "${srcdir}/cannelloni"
  make DESTDIR="$pkgdir/" install
}


pkgver() {
  cd "$srcdir/cannelloni"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
