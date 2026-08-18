
pkgname=soundcloud-desktop-bin
pkgver=8.4.13
pkgrel=2
pkgdesc="Unofficial desktop app for Soundcloud"
arch=(x86_64 aarch64)
url="https://github.com/zxcloli666/SoundCloud-Desktop"
license=(MIT)
depends=(
    ffmpeg
    gtk3
    libappindicator
    webkit2gtk-4.1
    )
source=("LICENSE-soundcloud-desktop-${pkgver}::https://github.com/zxcloli666/SoundCloud-Desktop/raw/${pkgver}/LICENSE")
source_x86_64=("https://github.com/zxcloli666/SoundCloud-Desktop/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/zxcloli666/SoundCloud-Desktop/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_arm64.deb")
sha256sums=('3bed3331b7048bac17cf50e249d560ccc9508c970da8d7b9283bf4f2e633a91d')
sha256sums_x86_64=('331cb2553e295e0c19f7967cba689c8cebd266fce3bfbe3d31b8c50455aa6475')
sha256sums_aarch64=('4f038e22daf8fdd7d35783a6199844e4105e7231d2151670a850c8d79c4f4999')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
  install -Dm644 "LICENSE-soundcloud-desktop-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Fails to start with nvidia cards, same as https://aur.archlinux.org/packages/armbian-imager-bin#comment-1069531
  sed -i 's/^Exec=/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /' "${pkgdir}/usr/share/applications/soundcloud-desktop.desktop"
}
