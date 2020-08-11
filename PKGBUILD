# Maintainer: Benjamin Feakins <feakster at posteo dot eu>
# Maintainer: Felix Golatofski <hidden>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi-codecs-ffmpeg-extra-bin/

pkgname=vivaldi-codecs-ffmpeg-extra-bin-arm
pkgver=84.0.4147.105
pkgrel=1
_ubuver=0ubuntu0
_ubudist=18.04.1
pkgdesc='Prebuilt ffmpeg-codecs package for Vivaldi for arm'
arch=('armv6h' 'armv7h' 'aarch64')
url='https://packages.ubuntu.com/bionic/chromium-codecs-ffmpeg-extra'
license=('LGPL')
depends=('vivaldi' 'perl')
makedepends=('wget')
changelog='changes'
provides=('vivaldi-ffmpeg-codecs')
source_armhf=("http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_armhf.deb")
source_armv6h=("$source_armhf")
source_armv7h=("$source_armhf")
source_aarch64=("http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_arm64.deb")
sha256sums_armv6h=('53f466657525f61ed48827af4774bc55617dab03d3cab292ed21280eee694855')
sha256sums_armv7h=('53f466657525f61ed48827af4774bc55617dab03d3cab292ed21280eee694855')
sha256sums_aarch64=('2b0a4b05dc8a1daa640ecc310b8618e5cfbbb62d0934c1db2bcaf51f0871c526')

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
