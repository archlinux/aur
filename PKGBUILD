# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: Jguer <joaogg3@gmail.com>
# Maintainer: Ariel AxionL <axionl@aosc.io>

pkgname="yay-gccgo-git"
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
source=("$pkgname::git+https://github.com/Jguer/yay.git#branch=master")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  sed -i "s:-ldflags '-s -w -X main.version=\${VERSION}':-gccgoflags '-Wl,-R,/usr/lib/gcc/\${CRACH}/8.1.1':g" Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
