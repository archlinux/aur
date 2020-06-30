# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=easytag
pkgname=easytag-opensuse-ogg-patch
pkgver=2.4.3
pkgrel=3
pkgdesc='Simple application for viewing and editing tags in audio files, using OpenSUSE patch'
arch=('x86_64')
license=('GPL')
url='https://wiki.gnome.org/Apps/EasyTAG'
makedepends=('intltool' 'itstool' 'python')
depends=('id3lib' 'libid3tag' 'gtk3' 'libvorbis' 'flac' 'speex' 'wavpack' 'taglib'
         'desktop-file-utils' 'opusfile')
conflicts=(easytag)
provides=(easytag)
source=(
    https://download.gnome.org/sources/${_pkgname}/${pkgver:0:3}/${_pkgname}-${pkgver}.tar.xz
    0001-easytag-revert-open-handle-ogg.rpatch
)
sha256sums=(
    'fc51ee92a705e3c5979dff1655f7496effb68b98f1ada0547e8cbbc033b67dd5'
    '114188c02e3641374b7c6fa5a662215a66fbe6d55e195d192a8856aab3ebdca0'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for f in "${srcdir}"/*.rpatch; do
    patch -p1 -R < "$f"
  done
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
