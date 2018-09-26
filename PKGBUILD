# Maintainer: aksr <aksr at t-com dot me>
pkgname=abduco-git
pkgver=0.r174.8f80aa8
pkgrel=1
pkgdesc="A session management and attach/detach functionality (to use together with dvtm(1))."
arch=('i686' 'x86_64')
url="http://www.brain-dump.org/projects/abduco/"
license=('BSD')
groups=()
depends=()
makedepends=('git')
optdepends=('dvtm')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git://repo.or.cz/abduco.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  ./configure
  make
}

package() {
  cd $srcdir/$pkgname
  make PREFIX="$pkgdir/usr" install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

