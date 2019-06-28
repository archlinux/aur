# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Christian Hesse <mail@eworm.de
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=squeezelite
pkgver=1.9.2.1165
pkgrel=1
pkgdesc="Lightweight headless squeezebox emulator"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/ralph-irving/squeezelite"
license=(GPL3)
depends=(alsa-lib faad2 flac libmad libvorbis mpg123 libsoxr ffmpeg)
install=${pkgname}.install
_commit=b265c78e583b2c45d6f3ae9d6168776c4da0347e
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/ralph-irving/squeezelite/archive/${_commit}.tar.gz"
        'service' 'conffile')
sha256sums=('3f27ac8ecd463a71181f5b788beab7bd70994d1c06c4a811a02fcf5e212a7109'
            '5b39e9754b6bcf06bcaaecab76ebf7c997966160b48692461d3be5d94ee5f004'
            'f0753a1cbd0194119226587ff9c12257438674d9b8e0179d22f0d5461ad3a70a')

build() {
  cd "${pkgname}-${_commit}"

  export LDFLAGS="${LDFLAGS} -lasound -lpthread -lm -lrt"
  export OPTS="${OPTS} -DDSD -DRESAMPLE -DVISEXPORT -DFFMPEG -DLINKALL"
  make
}

package() {
  cd "${pkgname}-${_commit}"

  install -m0755 -D squeezelite "${pkgdir}/usr/bin/squeezelite"
  install -Dm644 ../conffile "${pkgdir}/etc/squeezelite.conf.default"
  install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/squeezelite.service"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/squeezelite.LICENSE
}
