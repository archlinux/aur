# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=effectcraft-private-bin
pkgver=0.25.1
pkgrel=4
pkgdesc='自用维护：开源 clean-room 版 Adobe After Effects 替代（动效合成），上游 storytold/effectcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/effectcraft'
# GitHub 下载加速镜像；换镜像可 makepkg GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://gh-proxy.cn/}"
_gh_mirror="${_gh_mirror%/}/"
license=('MIT' 'Apache')
provides=("effectcraft=$pkgver")
conflicts=('effectcraft' 'effectcraft-bin' 'effectcraft-git' 'ai.storyteller.effectcraft')
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
source=("${_gh_mirror}https://github.com/storytold/effectcraft/releases/download/v${pkgver}/effectcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('3ad504e2ed230c50a6eaa1058026bf7805405c54bb001aead23ad3d1123278ba')

package() {
  bsdtar -xf "$srcdir/effectcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
