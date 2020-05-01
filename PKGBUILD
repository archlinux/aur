# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=ode
pkgver=0.16.1
pkgrel=1
pkgdesc='High performance library for simulating rigid body dynamics'
arch=('x86_64')
url='https://bitbucket.org/odedevs/ode/'
license=('BSD' 'LGPL')
source=("https://bitbucket.org/odedevs/$pkgname/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('b228acad81f33781d53eaf313437cc5d6f66aec5a4e56c515fc1b2d51e6e8eba')

prepare() {
  cd $pkgname-$pkgver

  ./bootstrap
}

build() {
  cd $pkgname-$pkgver

  export CXXFLAGS='-w -Ofast -fpermissive'

  ./configure \
    --prefix=/usr \
    --enable-shared \
    --enable-double-precision \
    --enable-libccd \
    --enable-ou \
    --enable-silent-rules
  make
}

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir" make install

  install -Dm644 ou/LICENSE-BSD.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD.TXT"
  install -Dm644 GIMPACT/GIMPACT-LICENSE-BSD.TXT "$pkgdir/usr/share/licenses/$pkgname/GIMPACT-LICENSE-BSD.TXT"
  install -Dm644 libccd/BSD-LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-LICENSE"
}

# getver: bitbucket.org/odedevs/ode/raw/tip/configure.ac
# vim: ts=2 sw=2 et:
