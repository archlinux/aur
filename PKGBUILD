# Maintainer: aksr <aksr at t-com dot me>
pkgname=cqmetrics-git
pkgver=r134.fa4149a
pkgrel=1
epoch=
pkgdesc="C Quality Metrics"
arch=('i686' 'x86_64')
url="https://github.com/dspinellis/cqmetrics"
license=('Apache')
groups=()
depends=('cppunit')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('cqmetrics')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/dspinellis/cqmetrics.git")
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
  install -Dm755 qmcalc $pkgdir/usr/bin/qmcalc
  for i in metric-names.sed showstyle.sh sumstyle.sh README.md; do
    install -Dm644 $i $pkgdir/usr/share/doc/${pkgname%-*}/$i
  done
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

