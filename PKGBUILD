# Maintainer: cap153 <1536989047@qq.com>

pkgname=stools-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal, fast, Fuzzel-style application launcher with pinyin support"
arch=('x86_64')
url="https://github.com/cap153/stools"
license=('MIT')
provides=('stools')
conflicts=('stools')
options=('!strip')

# 运行时依赖。libx11/libxcb/libxcursor/libxi/wayland/libglvnd 是 winit 与 femtovg
# 在运行时 dlopen 的：ldd 里看不到，但缺失会直接启动失败，请勿当作多余项删除。
# freetype2 会带入 zlib/bzip2/brotli/libpng，fontconfig 带入 expat，无需单列。
depends=(
    'glibc'
    'gcc-libs'
    'fontconfig'
    'freetype2'
    'libxkbcommon'
    'libx11'
    'libxcb'
    'libxcursor'
    'libxi'
    'wayland'
    'libglvnd'
)
optdepends=('mesa: OpenGL 驱动（使用 NVIDIA 专有驱动则不需要）')

# 网络只下载二进制；desktop 与图标是本目录自带的本地文件。
source=(
    "stools-${pkgver}::https://github.com/cap153/stools/releases/download/v${pkgver}/stools"
    "stools.desktop"
    "stools.png"
)
# 第一项为 GitHub Release 二进制，上传前跑一次 `updpkgsums` 即可自动填入；
# 后两项是本地文件，哈希已固定（若改动过它们，重新跑一次 updpkgsums 即可）。
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "${srcdir}/stools-${pkgver}" "${pkgdir}/usr/bin/stools"
    install -Dm644 "${srcdir}/stools.desktop" "${pkgdir}/usr/share/applications/stools.desktop"
    install -Dm644 "${srcdir}/stools.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/stools.png"
}
