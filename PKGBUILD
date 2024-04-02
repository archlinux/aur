# Maintainer: Arthur LAURENT <arthur.laurent@gmail.com>

pkgname=nzsl
pkgver=20240227
pkgrel=6
pkgdesc="A shader language inspired by Rust and C++ which compiles to GLSL or SPIRV (without any additional dependency)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/NazaraEngine/ShaderLang"
license=('MIT')
options=()
depends=('gcc-libs' 'glibc')
makedepends=('xmake' 'fast_float' 'git')

source=("git+https://github.com/NazaraEngine/ShaderLang.git#commit=00426331127bca10b79498e3b1edf5a4d1d87986")

sha256sums=('SKIP')

prepare() {
   cd "${srcdir}/ShaderLang"
   xmake f -k shared -m releasedbg --tests=y --examples=n --yes $XMAKECONFIGUREFLAGS
}

build() {
   cd "${srcdir}/ShaderLang"
   xmake b $XMAKEBUILDFLAGS
}

check() {
   cd "${srcdir}/ShaderLang"
   xmake run UnitTests
}

package() {
   cd "${srcdir}/ShaderLang"
   xmake install --root -o "${pkgdir}/usr" nzslc
   install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
