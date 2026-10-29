# Maintainer: Atomic Chat <support@atomic.chat>
#
# Generated from packaging/PKGBUILD.in in https://github.com/AtomicBot-ai/Atomic-Chat by the linux-repo
# workflow (scripts/linux-packages.mjs pkgbuild); change the template there, not this copy.

pkgname=atomic-chat-bin
pkgver=2.2.29
_version=2.2.29
pkgrel=1
pkgdesc='Local AI app and inference engine for agents: run open-weight LLMs locally (https://atomic.chat)'
arch=('x86_64' 'aarch64')
url='https://github.com/AtomicBot-ai/Atomic-Chat'
license=('Apache-2.0')
# What the payload's ELF files link (the deb's Depends, read from them, in Arch's names) and
# libayatana-appindicator, which the tray opens at run time.
depends=('alsa-lib' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libayatana-appindicator'
         'libsoup3' 'openssl' 'vulkan-icd-loader' 'wayland' 'webkit2gtk-4.1')
optdepends=('gst-plugins-base: audio and video in chats'
            'gst-plugins-good: audio and video in chats'
            'xdg-utils: open links in the browser')
provides=('atomic-chat')
conflicts=('atomic-chat')
# The core binaries are Bun-compiled: their program follows the executable, and stripping cuts it off.
options=('!strip' '!debug')
# On an upgrade: quit and restart the running app (pacman does not run the deb's postinst).
install=atomic-chat-bin.install

# The release's deb, the same files the deb and rpm install.
_base='https://github.com/AtomicBot-ai/Atomic-Chat/releases/download/v2.2.29'
source_x86_64=("atomic-chat-${_version}-x86_64.deb::${_base}/atomic-chat_${_version}_amd64.deb")
source_aarch64=("atomic-chat-${_version}-aarch64.deb::${_base}/atomic-chat_${_version}_arm64.deb")
sha256sums_x86_64=('73c10f37f0010d1f0a1d81cb06b9fdf3486b7af6178a7406c66e6ed0e6506e83')
sha256sums_aarch64=('1787f74a785d7a3994219f4113b3abff75efc51626b865bf0aca55fed7aec2bc')

package() {
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
  # Arch keeps licenses under the package's own name.
  mv "${pkgdir}/usr/share/licenses/atomic-chat" "${pkgdir}/usr/share/licenses/${pkgname}"
}
