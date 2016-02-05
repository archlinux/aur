# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=enventor
pkgver=0.7.0
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl)"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/projects/enventor/"
license=('BSD')
depends=('elementary')
source=("http://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6b66800f9dd409d472bcdbc2ba55fd9dea3aed82eec3bca2d158ac44e71fd0ad')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --disable-static

  make EOLIAN_FLAGS="--eo $(pkg-config --variable eolian_flags eo efl evas elementary)"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}
