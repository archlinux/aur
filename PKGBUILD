# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Maintainer: Matti Viljanen <matti.viljanen@kapsi.fi>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=86.0.4240.198
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
sha256sums_x86_64=('94f2328e3ab8e93b8f58fdaf668f93c682ce8d243d3eb9a18a4d7a37eb4cc4fe')
sha256sums_i686=('95304070caa49668a6aae423a73d44ae4263eae44c3ae29b0bc79837bf5d7ea0')
sha256sums_arm=('ce5ebce4928c74cbeae92bbf8d8d21fe3bd4500c87376ba31423ba7336fbb201')
sha256sums_armv6h=('ce5ebce4928c74cbeae92bbf8d8d21fe3bd4500c87376ba31423ba7336fbb201')
sha256sums_armv7h=('ce5ebce4928c74cbeae92bbf8d8d21fe3bd4500c87376ba31423ba7336fbb201')
sha256sums_aarch64=('2791abde14440e7e04eb0c2c30c9f52f75ae9216a6afa3b861c4b4fa400104cb')

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
