# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=79.0.3945.79
pkgver2=0ubuntu0
pkgver3=19.04.3
pkgrel=1
pkgdesc="Prebuilt ffmpeg-codecs package for vivaldi"
arch=("x86_64")
url="https://packages.ubuntu.com/bionic/amd64/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
depends=('vivaldi' 'perl' 'wget')
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(
  "http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${pkgver2}.${pkgver3}_amd64.deb"
)
md5sums=("9bf1ad825cf0df0e52e4a1e904c1b74f")

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  VIVALDI_VERSION=$(cat /opt/vivaldi/vivaldi | perl -ne '/(?:VIVALDI_VERSION=.)(\d*\.\d*)/ and print "$1";')
  install -Dm644 "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/libffmpeg.so.$VIVALDI_VERSION"
}
