# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bcftools-git
pkgver=1.10.2.r123.gdc26549
pkgrel=1
pkgdesc="Tools for variant calling and manipulating VCFs and BCFs"
arch=('i686' 'x86_64')
url="https://samtools.github.io/bcftools/"
license=('custom')
depends=('glibc' 'gsl' 'htslib' 'zlib')
makedepends=('git')
optdepends=('python')
provides=('bcftools')
conflicts=('bcftools')
source=("git+https://github.com/samtools/bcftools.git")
sha256sums=('SKIP')


pkgver() {
  cd "bcftools"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bcftools"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --with-bcf-plugin-dir=/usr/lib/bcftools \
    --enable-libgsl
  make
}

check() {
  cd "bcftools"

  #make check
}

package() {
  cd "bcftools"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bcftools"
}
