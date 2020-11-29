# Maintainer: Alexander Georgievskiy <galeksandrp@gmail.com>

pkgname=lib32-ffmpeg-steam
pkgver=0.1.0
pkgrel=1
pkgdesc='ln -s /usr/lib32/libav*.so.57 /home/*/.local/share/Steam/ubuntu12_32/libav*.so.57 (fix VAAPI memleak for Steam)'
arch=(x86_64)
url='https://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=(lib32-ffmpeg-compat-57)
makedepends=()
optdepends=()
source=()
sha512sums=()

symlink() {
  find /home -type f ! -wholename '*/steam-runtime/*' -name "$1" -exec bash -c "mkdir -p ${pkgdir}\$(dirname {})" \;
  find /home -type f ! -wholename '*/steam-runtime/*' -name "$1" -exec bash -c "ln -s /usr/lib32/\$(basename {}) ${pkgdir}{}" \;
}

package() {
  symlink 'libavresample.so*'
  symlink 'libavcodec.so*'
  symlink 'libavutil.so*'
  symlink 'libavformat.so*'
}
