# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: Jguer <joaogg3@gmail.com>
# Maintainer: Ariel AxionL <axionl@aosc.io>

pkgname="yay-gcc-git"
_pkgname="yay"
pkgver=8.922.r34.ga3564ec
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. (gccgo version, proxychains support)"
arch=('x86_64')
url="https://github.com/Jguer/yay"
license=('GPL')
options=('!strip' '!emptydirs')
depends=('pacman>=5.1')
makedepends=('gcc-go' 'git')
conflicts=('yay-bin' 'yay' 'yay-git')
provides=('yay')
source=("yay::git+https://github.com/Jguer/yay.git#branch=master")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  sed -i "s:-ldflags '-s -w -X main.version=\${VERSION}':-gccgoflags '-Wl,-R,/usr/lib/gcc/\${CRACH}/8.1.1':g" Makefile
}

build() {
  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver
}

package() {
  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" install
}
