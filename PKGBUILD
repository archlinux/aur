#Maintainer: dreieck
#Contributor: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=unison-gtk
_pkgver=2.48.4
_debianver="-1+b1"
pkgname="${_pkgname}-${_pkgver}-compat-bin"
pkgver="${_pkgver}"
pkgrel=3
pkgdesc="GTK2-GUI for unison. Specific version ${_pkgver}, compatible with parallel installation to other versions of unison binaries (but pay attention to the local user configurations!). Prebuilt binary from debian, repackaged."
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=(
  'x86_64'
)
license=('GPL2')
depends=(
  ${_pkgname%-gtk}-${_pkgver}
  "gtk2"
)
provides=(
  "${_pkgname}-${_pkgver}=${pkgver}"
  "${_pkgname}-${_pkgver%.*}=${pkgver}"
  "${_pkgname}-${_pkgver}-compat=${pkgver}"
  "${_pkgname}-${_pkgver%.*}-compat=${pkgver}"
)
conflicts=(
  "${_pkgname}-${pkgver%.*}"
)
source=(
  "http://ftp.de.debian.org/debian/pool/main/u/${_pkgname%-gtk}/${_pkgname}_${_pkgver}${_debianver}_amd64.deb"
)
sha256sums=(
  '54ab2d5a7595ef82950f2c3228adc98e022690fb0ba25102d479da46124f32ce'
)

prepare() {
  _content="data.tar.xz"
  mkdir -p "${srcdir}/content"
  cd "${srcdir}/content"
  msg2 "Extracting ${_content} ..."
  bsdtar xf "${srcdir}/${_content}"
}

package() {
    cd "${srcdir}/content"

    cp -a "${srcdir}/content"/* "${pkgdir}"/

    rm -R "${pkgdir}/usr/bin/unison-latest-stable-gtk"
    rm -R "${pkgdir}/usr/share/man/man1/unison-latest-stable-gtk.1.gz"

    cd "${pkgdir}"/usr/bin
    ln -s "unison-${_pkgver}-gtk" "unison-${_pkgver}-x11"
}
