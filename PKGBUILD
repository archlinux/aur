# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jochem Kossen <j.kossen@home.nl>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: schuay <jakob.gruber@gmail.com>

pkgname=abcde-musicbrainz
_pkgname=abcde
pkgver=2.9.1
pkgrel=2
pkgdesc='Command-line CD ripping, encoding and tagging utility in one go, with default musicbrainz support'
arch=('any')
url='https://abcde.einval.com/'
license=('GPL')
depends=('bash' 'cd-discid' 'wget' 'vorbis-tools' 'perl-webservice-musicbrainz' 'perl-musicbrainz-discid')
optdepends=('cdparanoia: Paranoia ripping support'
            'flac: FLAC encoding support'
            'glyr: album art support'
            'lame: MP3 encoding support'
            'python-eyed3: ID3 tag support'
            'vorbisgain: Ogg Vorbis normalization support')
provides=(abcde)
conflicts=(abcde)
backup=("etc/${_pkgname}.conf")
source=("https://abcde.einval.com/download/abcde-${pkgver}.tar.gz"{,.sign})
validpgpkeys=('CEBB52301D617E910390FE16587979573442684E'
              '742D444A5AFAF2951EF33E7BF8FB375D9CC820B3') # Steve McIntyre, Andrew Strong
sha256sums=('70ec6e06b791115fbe88dee313f58f691f9b559ee992f2af5ed64fe6ad2e55d7'
            'SKIP')

build() {
  cd "${_pkgname}-${pkgver}"
  sed -e "s:normalize-audio:normalize:g" -i ${_pkgname}
}

package() {
  make -C "${_pkgname}-${pkgver}" DESTDIR="${pkgdir}" prefix=/usr sysconfdir=/etc install
}

