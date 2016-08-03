# Maintainer: aksr <aksr at t-com dot me>
pkgname=sgsh-git
pkgver=r519.67a984f
pkgrel=1
epoch=
pkgdesc="Shell supporting scatter-gather pipelines"
arch=('i686' 'x86_64')
url="https://github.com/dspinellis/sgsh"
url="http://www.spinellis.gr/sw/sgsh/"
license=('apache,various')
groups=()
depends=('')
makedepends=('git')
optdepends=('graphviz: to visualize the sgsh graphs'
            'perl-graph: to detect cycles (can lead to deadlocks)')
checkdepends=()
provides=()
conflicts=('sgsh')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/dspinellis/sgsh.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make INSTPREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

