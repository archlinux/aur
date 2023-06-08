pkgname=julia-bin
pkgver=1.9.1
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
    sha256sums=('b643ccd3e2a5960f7ce7055243743d0a39badda3974bce3d77861dd363badd10')
    source=("https://julialang-s3.julialang.org/bin/linux/${_pkgarch}/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
    ;;
  x86_64) _pkgarch="x64"
    sha256sums=('cde14a58f899251f30cfced87055626f44845780659ebe8d50cbc4c67b31997c')
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
