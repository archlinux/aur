# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Christian Hesse <mail@eworm.de
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=squeezelite
pkgver=1.9.8.1307
pkgrel=1
pkgdesc="Lightweight headless squeezebox emulator"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/ralph-irving/squeezelite"
license=(GPL3)
depends=(alsa-lib faad2 flac libmad libvorbis mpg123 libsoxr ffmpeg)
install=${pkgname}.install
_commit=02d08c7f42031434bab24590bcdb83a4806cb3cd
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/ralph-irving/squeezelite/archive/${_commit}.tar.gz"
        'service' 'conffile')
sha256sums=('0294c0e63435f5e8afd30438a4d6234cbc7df33fb5e66417e65cdf0380c694a3'
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
