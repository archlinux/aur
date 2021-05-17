# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=soundux
pkgver=0.2.3
pkgrel=1
pkgdesc="A cross-platform soundboard - stable version"
arch=('any')
url="https://github.com/Soundux/Soundux"
license=('GPL3')
depends=('pulseaudio' 'webkit2gtk' 'libwnck3' 'libappindicator-gtk3' 'lsb-release')
optdepends=('youtube-dl: downloader integration' 'ffmpeg: downloader integration')
makedepends=('git' 'cmake' 'ninja')
source=("https://github.com/Soundux/Soundux/releases/download/$pkgver/soundux-$pkgver.tar.gz")
sha256sums=('7e43d77e87c87fae718e4a4455a843d8a4c2f0d21cc783e6bf36dcfe43d0d151')

build() {
  cd "${srcdir}/Soundux"
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  cd "${srcdir}/Soundux/build"
  DESTDIR="$pkgdir/" ninja install
  # install binary symlink
  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf /opt/soundux/soundux "${pkgdir}/usr/bin/soundux"
  
  # install doc
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/Soundux/README.md"
  # install license
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/Soundux/LICENSE"
}
