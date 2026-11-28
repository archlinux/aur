# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=deckcraft-private-bin
pkgver=0.19.1
pkgrel=4
pkgdesc='自用维护：开源 clean-room 版 PowerPoint 替代（演示文稿），上游 storytold/deckcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/deckcraft'
# GitHub 下载加速镜像；换镜像可 makepkg GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://cdn.gh-proxy.org/}"
_gh_mirror="${_gh_mirror%/}/"
license=('MIT' 'Apache')
provides=("deckcraft=$pkgver")
conflicts=('deckcraft' 'deckcraft-bin' 'deckcraft-git' 'ai.storyteller.deckcraft')
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
source=("${_gh_mirror}https://github.com/storytold/deckcraft/releases/download/v${pkgver}/deckcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('081072ab8ba83c0eef63980b692f99b545d44581933c53934ec2a53d5cbe9d77')

package() {
  bsdtar -xf "$srcdir/deckcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
