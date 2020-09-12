# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Maintainer: Matti Viljanen <matti.viljanen@kapsi.fi>
pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=85.0.4183.83
_ubuver=0ubuntu0
_ubudist=18.04.2
pkgrel=1
pkgdesc="Prebuilt ffmpeg codecs package for Vivaldi"
arch=("x86_64")
url="https://packages.ubuntu.com/bionic/amd64/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
depends=('vivaldi' 'perl')
makedepends=('wget')
changelog="changes"
provides=(
  'vivaldi-ffmpeg-codecs'
)
conflicts=(
  'vivaldi-ffmpeg-codecs'
)
source=(
  "http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_amd64.deb"
)
md5sums=('ff12145531e432f9a3959fba74f8f715')

prepare() {
  tar -xJf data.tar.xz
  gzip -f usr/share/doc/chromium-codecs-ffmpeg-extra/copyright
}

package() {
  VIVALDI_VERSION=$(cat /opt/vivaldi/vivaldi | perl -ne '/(?:VIVALDI_VERSION=.)(\d*\.\d*)/ and print "$1";')
  install -Dm644 "usr/lib/chromium-browser/libffmpeg.so" "$pkgdir/opt/vivaldi/libffmpeg.so.$VIVALDI_VERSION"
  install -Dm644 "usr/share/doc/chromium-codecs-ffmpeg-extra/copyright.gz" "$pkgdir/usr/share/doc/$pkgname/copyright.gz"
  install -Dm644 "usr/share/doc/chromium-codecs-ffmpeg-extra/changelog.Debian.gz" "$pkgdir/usr/share/doc/$pkgname/changelog.Debian.gz"
}
