pkgname=julia-bin
pkgver=1.8.5
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
url='https://julialang.org/'
license=('MIT')

case "$CARCH" in
  aarch64) _pkgarch="aarch64"
    sha256sums=('a1f637b44c71ea9bc96d7c3ef347724c054a1e5227b980adebfc33599e5153a4')
    source=("https://julialang-s3.julialang.org/bin/linux/${_pkgarch}/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
    ;;
  x86_64) _pkgarch="x64"
    sha256sums=('e71a24816e8fe9d5f4807664cbbb42738f5aa9fe05397d35c81d4c5d649b9d05')
    source=("https://julialang-s3.julialang.org/bin/linux/${_pkgarch}/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
    ;;
esac

options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia/LICENSE.md
}

# vim: ts=2 sw=2 et:

