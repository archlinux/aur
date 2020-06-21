# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
pkgname=julia-nightly-bin
pkgver=20200620
pkgrel=1
arch=('x86_64')
pkgdesc='High-level, high-performance, dynamic programming language - official nightly binaries'
provides=(julia-nightly)
conflicts=(julia julia-git julia-beta-bin julia-bin)
depends=('gmp' 'suitesparse' 'hicolor-icon-theme' 'libssh2')
url='https://julialang.org/'
license=('MIT')
source=($pkgname-$pkgver.tar.gz::"https://julialangnightlies-s3.julialang.org/bin/linux/x64/julia-latest-linux64.tar.gz")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
  curl -sL https://julialangnightlies-s3.julialang.org/ | sed 's/<\/Contents>/<\/Contents>\n/g' | grep "julia-latest-freebsd64.tar.gz" | cut -d '>' -f 5 | sed 's/<.*//g' | sed 's/T.*//g' | head -n 1 | sed 's/-//g'
}

package() {
  hash=$(ls -ld $srcdir/* | grep -v tar | tail -n 1 | rev | cut -d '-' -f 1 | rev)
  cd $srcdir/julia-${hash}
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp -r {bin,etc,include,lib,share} ${pkgdir}/usr/
  install -Dm644 LICENSE.md \
      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
