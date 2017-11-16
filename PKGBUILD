# Maintainer: Benjamin M. <benmoran56@gmail.com>
# Maintainer: Haruki Ota <ootaharuki99[at]gmail.com>
pkgname=recdvb
pkgver=1.3.3
pkgrel=3
pkgdesc='Simple command-line utility to record DVB streams.'
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc' 'libarib25-git')
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
  cd "recdvb-$pkgver"

  chmod +x autogen.sh
  ./autogen.sh
  if [ $_b25support = true ]; then
    echo "Building with b25 support ..."
    ./configure --enable-b25
  else
    echo "Building with NO b25 support ..."
    ./configure
  fi
  make
}

package() {
  cd "recdvb-$pkgver"

  install -D -m 755 recdvb "$pkgdir/usr/bin/recdvb"
  install -D -m 755 recdvbctl "$pkgdir/usr/bin/recdvbctl"
  install -D -m 755 recdvbchksig "$pkgdir/usr/bin/recdvbchksig"
}

