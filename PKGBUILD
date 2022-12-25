pkgname=julia-bin
pkgver=1.8.4
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
    sha256sums=('dc4798c1ce8768fa35972e8b149ca3a85fc69e1074b609a72b2cfed5c4aa7050')
    source=("https://julialang-s3.julialang.org/bin/linux/${_pkgarch}/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
    ;;
  x86_64) _pkgarch="x64"
    sha256sums=('f0427a4d7910c47dc7c31f65ba7ecaafedbbc0eceb39c320a37fa33598004fd5')
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

