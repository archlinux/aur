# Maintainer: Benjamin M. <benmoran56@gmail.com>
# Maintainer: HRKo <hrko[at]r-c.dev>
pkgname=recdvb
pkgver=1.3.3
pkgrel=4
pkgdesc='Simple command-line utility to record DVB streams.'
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc' 'libarib25')
url='http://github.com/k-pi/recdvb'
license=('GPL3')
source=('https://github.com/k-pi/recdvb/archive/v1.3.3.tar.gz')
md5sums=('7149cba23942453fad9de3be5d2206a9')
# If you do not want b25 support, set the variable _b25support to false.
_b25support=true

if [ $_b25support = false ]; then
  depends=('glibc')
fi

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sh ./autogen.sh
  if [ $_b25support = true ]; then
    msg2 "Configuring with b25 support..."
    ./configure --enable-b25 --prefix=/usr
  else
    msg2 "Configuring without b25 support..."
    ./configure --prefix=/usr
  fi
  msg2 "Building..."
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir/" install
}

