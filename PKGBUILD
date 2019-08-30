# Maintainer: aksr <aksr at t-com dot me>
pkgname=reap-git
pkgver=0.1.r0.g10e7856
pkgrel=1
epoch=
pkgdesc="Run process until all its spawned processes are dead."
arch=('i686' 'x86_64')
url="https://github.com/leahneukirchen/reap"
license=('publicdomain')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
#  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd "$srcdir/$pkgname"
#  ./autogen.sh
#}

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="usr/" install
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  #install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

