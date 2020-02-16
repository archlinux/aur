# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Maintainer: Matti Viljanen <matti.viljanen@kapsi.fi>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=80.0.3987.87
pkgver2=0ubuntu0
pkgver3=18.04.1
pkgrel=1
pkgdesc="Prebuilt ffmpeg codecs package for Vivaldi"
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
md5sums=("8ce0cc80a5509d00ec5717811df79e77")

prepare() {
  cd "$srcdir"
  tar -xJf data.tar.xz
}

package() {
  VIVALDI_VERSION=$(cat /opt/vivaldi/vivaldi | perl -ne '/(?:VIVALDI_VERSION=.)(\d*\.\d*)/ and print "$1";')
  install -Dm644 "$srcdir/usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/libffmpeg.so.$VIVALDI_VERSION"
}
