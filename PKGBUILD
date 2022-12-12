# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=leafpad
pkgver=0.8.19
pkgrel=2
pkgdesc='A notepad clone for GTK+ 2.0'
arch=('x86_64')
url='http://tarot.freeshell.org/leafpad/'
license=('GPL')
depends=('gtk2')
makedepends=('intltool')
validpgpkeys=('05B80A3FFAF8FED36ADC7A31EE109F4A0F184934') # Tarot Osuji <tarot@sdf.org>
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
        '0001-fix-format-security-error-from-gcc.patch')
sha256sums=('07d3f712f4dbd0a33251fd1dee14e21afdc9f92090fc768c11ab0ac556adbe97'
            'SKIP'
            '2b99426837e0a78077931e33bbfac280b238e0d170366c09e62bf98770e837dc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 < ../0001-fix-format-security-error-from-gcc.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-chooser
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  echo 'StartupNotify=true' >> "${pkgdir}/usr/share/applications/leafpad.desktop"
}
