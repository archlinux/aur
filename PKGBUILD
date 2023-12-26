# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=appimaged-bin
pkgdesc="Deprecated: A daemon that monitors the system and integrates AppImages"
url="https://github.com/AppImageCommunity/appimaged"
pkgver=r199
pkgrel=1
arch=(x86_64)
license=(MIT)
depends=(gdk-pixbuf2)
source=("appimaged.AppImage"::"https://github.com/AppImageCommunity/appimaged/releases/download/continuous/appimaged-x86_64.AppImage")
sha256sums=(0cb439698ccd542c622c5aec5496efb0fe6a56575b16be9e77bd5467b97b4555)

prepare() {
  chmod +x appimaged.AppImage
}

package() {
  for pattern in usr/{lib/systemd,bin,share/{applications,icons,metainfo}}; do
    ./appimaged.AppImage --appimage-extract "${pattern}"
  done

  mv -fT squashfs-root "${pkgdir}"
}
