# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Maintainer: Matti Viljanen <matti.viljanen@kapsi.fi>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=vivaldi-codecs-ffmpeg-extra-bin
pkgver=91.0.4472.101
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
sha256sums_x86_64=('add7df46faf5efe934d3bf284180ec27a59f208bfdb23716aeffd18e746dcdc6')
sha256sums_i686=('ef5ad8c754105b8885607d39cc35933bd74a7398197f417653213da356ebb39e')
sha256sums_arm=('6ee49f2c18772a815b52716623990481a1f2e75d9c3aa804d7fcd3f32f337f85')
sha256sums_armv6h=('6ee49f2c18772a815b52716623990481a1f2e75d9c3aa804d7fcd3f32f337f85')
sha256sums_armv7h=('6ee49f2c18772a815b52716623990481a1f2e75d9c3aa804d7fcd3f32f337f85')
sha256sums_aarch64=('5d0e0bb21758cdae97699509af5a8895fe3162ee9b80b967527e70d3fd3b34a3')

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
