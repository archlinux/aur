# Maintainer: 0xGingi <0xgingi@0xgingi.com>

_pkgbasename=ghostty
pkgname=${_pkgbasename}-git-zen3
pkgrel=1
pkgver=r7724.7b668d3d
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features (Zen 3 optimized)"
arch=('x86_64')
url="https://github.com/ghostty-org/${_pkgbasename}"
provides=('ghostty')
conflicts=('ghostty' 'ghostty-git')
license=('custom')
depends=(
    'bzip2'
    'fontconfig'
    'freetype2'
    'gtk4'
    'harfbuzz'
    'libadwaita'
    'libpng'
    'oniguruma'
    'pixman'
    'zlib'
)
makedepends=('git' 'zig>=0.13.0' 'zig<0.14.0' 'pandoc-cli')
source=("git+https://github.com/ghostty-org/${_pkgbasename}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgbasename}"
    zig build \
      -Dtarget=x86_64-linux-gnu \
      -Dcpu=znver3 \
      -Doptimize=ReleaseFast \
      -Dcpu_features=+adx,+aes,+avx,+avx2,+bmi,+bmi2,+clflushopt,+f16c,+fma,+fsgsbase,+lzcnt,+movbe,+pclmul,+popcnt,+prfchw,+rdpid,+rdrnd,+rdseed,+sha,+sse4a,+vaes,+vpclmulqdq,+wbnoinvd \
      -Demit-docs \
      -Dstatic=false
}

package() {
    cd "${srcdir}/${_pkgbasename}"
    zig build \
      -Dtarget=x86_64-linux-gnu \
      -Dcpu=znver3 \
      -Doptimize=ReleaseFast \
      -Dcpu_features=+adx,+aes,+avx,+avx2,+bmi,+bmi2,+clflushopt,+f16c,+fma,+fsgsbase,+lzcnt,+movbe,+pclmul,+popcnt,+prfchw,+rdpid,+rdrnd,+rdseed,+sha,+sse4a,+vaes,+vpclmulqdq,+wbnoinvd \
      -Demit-docs \
      -Dstatic=false \
      -p "$pkgdir/usr"
}
