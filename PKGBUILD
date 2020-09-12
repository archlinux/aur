# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Maintainer: Matti Viljanen <matti.viljanen@kapsi.fi>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=85.0.4183.83
_ubuver=0ubuntu0
_ubudist=18.04.2
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
sha256sums_x86_64=('b2fdac7a276c10bd6a91cd1266ac46b79a6e2f2d98fd8178fd0dc6b8e7f0f6f9')
sha256sums_i686=('5548d4162c2eb9fe07cc04f5eef09b13f5693766bff44256b75c09551a5a87a1')
sha256sums_arm=('51e005c5039112736fac9031747220aee3f057ced46c5577375896021003a8c4')
sha256sums_armv6h=('51e005c5039112736fac9031747220aee3f057ced46c5577375896021003a8c4')
sha256sums_armv7h=('51e005c5039112736fac9031747220aee3f057ced46c5577375896021003a8c4')
sha256sums_aarch64=('9d9303b70b43b15133a1048c01b982b60225f48ec2e1438e1455599876409a3f')

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
