# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Maintainer: Matti Viljanen <matti.viljanen@kapsi.fi>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=86.0.4240.75
_ubuver=0ubuntu0
_ubudist=18.04.1
pkgrel=1
pkgdesc="Prebuilt ffmpeg codecs package for Vivaldi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://packages.ubuntu.com/bionic/amd64/chromium-codecs-ffmpeg-extra/download"
license=('LGPL')
depends=('vivaldi' 'perl')
makedepends=('wget')
changelog="changes"
provides=('vivaldi-ffmpeg-codecs' 'vivaldi-codecs-ffmpeg-extra-bin-rpi' 'vivaldi-codecs-ffmpeg-extra-bin-arm64')
conflicts=('vivaldi-ffmpeg-codecs' 'vivaldi-codecs-ffmpeg-extra-bin-rpi' 'vivaldi-codecs-ffmpeg-extra-bin-arm64')
replaces=('vivaldi-codecs-ffmpeg-extra-bin-rpi' 'vivaldi-codecs-ffmpeg-extra-bin-arm64')
source=("update_pkg.sh")
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_amd64.deb")
source_i686=("http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_i386.deb")
source_arm=("http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_armhf.deb")
source_armv6h=("$source_arm")
source_armv7h=("$source_arm")
source_aarch64=("http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_arm64.deb")
sha256sums=('a0983819ab143f2ea414cdb9a49d508b111aa6d5a4a365c8cb8f7c102239ca22')
sha256sums_x86_64=('826fffbe013907a494ea1b8d3d7f410f7267414146a37abf3d368ff85ea71d30')
sha256sums_i686=('7f57467a5c8594cf1899e5e0277ca824a02c5388bcbd1d9d45229839afd54d48')
sha256sums_arm=('96763d46e6ad73a0093ba7748627db2107b4d448067a05b9fb614a1d774ef63e')
sha256sums_armv6h=('96763d46e6ad73a0093ba7748627db2107b4d448067a05b9fb614a1d774ef63e')
sha256sums_armv7h=('96763d46e6ad73a0093ba7748627db2107b4d448067a05b9fb614a1d774ef63e')
sha256sums_aarch64=('39524146b72f8f15ab7f815173cab4110a7a2993586b603b2da9e223c052d27a')

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
