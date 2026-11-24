# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=pdfcraft-private-bin
pkgver=0.22.0
pkgrel=4
pkgdesc='自用维护：开源 clean-room 版 Adobe Acrobat 替代（PDF 阅读整理保护），上游 storytold/pdfcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/pdfcraft'
# GitHub 下载加速镜像；换镜像可 makepkg GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://gh-proxy.cn/}"
_gh_mirror="${_gh_mirror%/}/"
license=('MIT' 'Apache')
provides=("pdfcraft=$pkgver")
conflicts=('pdfcraft' 'pdfcraft-bin' 'pdfcraft-git' 'ai.storyteller.pdfcraft')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader')
optdepends=('alsa-lib: sound support'
            'pipewire-alsa: audio playback and recording via PipeWire'
            'pulseaudio: audio playback and recording via PulseAudio'
            'wayland: native Wayland display support'
            'libx11: X11 and XWayland display support'
            'libxcursor: X11 cursor handling'
            'libxi: X11 input handling'
            'libxrandr: X11 display resolution handling'
            'libglvnd: GPU rendering through EGL'
            'mesa: GPU rendering through EGL'
            'vulkan-driver: GPU rendering through Vulkan'
            'xdg-desktop-portal: native desktop integration and file dialogs'
            'cups: printing support')
source=("${_gh_mirror}https://github.com/storytold/pdfcraft/releases/download/v${pkgver}/pdfcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('865a70e73cbcc8d36b199ac466a625400ff58bba95e88879e3ed28f5e4e4c428')

package() {
  bsdtar -xf "$srcdir/pdfcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
