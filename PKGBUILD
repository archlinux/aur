# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=boxedwine-git
pkgver=21.0.1.r268.g88ac5138
pkgrel=1
pkgdesc="An emulator that runs 16-bit and 32-bit Windows applications"
arch=('x86_64')
url="https://www.boxedwine.org"
license=('GPL2')
depends=('minizip' 'openssl' 'poco' 'sdl2')
makedepends=('apache' 'apr-util' 'cmake' 'git' 'glu' 'libmysqlclient' 'postgresql')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/danoon2/Boxedwine.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'c9686d8694796b110bfa2876684ef1a42e657fd12781c7180e893328c5b7d79c')

pkgver() {
  cd "$srcdir/Boxedwine"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/Boxedwine"

  pushd project/linux
  sh build.sh
  popd
}

package() {
  cd "$srcdir/Boxedwine"
  install -Dm755 "project/linux/bin/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
}
