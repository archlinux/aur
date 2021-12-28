# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Maintainer: Matti Viljanen <matti.viljanen@kapsi.fi>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=95.0.4638.69
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
sha256sums_x86_64=('f887848aa100046f674a39e10ff181ba8eabf17fe25ebcf7ae3a9b3b474b4548')
sha256sums_i686=('e084feefe257e73498652f6435f87d55182faf25057b8546a9df3e471827ae30')
sha256sums_arm=('291c4ca92ed9b03c0de0af139cf382cd45dd010806d4dcd27a2f7af7f5169f0e')
sha256sums_armv6h=('291c4ca92ed9b03c0de0af139cf382cd45dd010806d4dcd27a2f7af7f5169f0e')
sha256sums_armv7h=('291c4ca92ed9b03c0de0af139cf382cd45dd010806d4dcd27a2f7af7f5169f0e')
sha256sums_aarch64=('a464f571c8f9801b21c1fe6c9cc967a750daad75016b764f20fd03fa04849635')

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
