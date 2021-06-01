# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=jtdxhamlib
pkgver=4.2
pkgrel=1
pkgdesc='Modified hamlib for jtdx'
arch=('x86_64')
url='https://github.com/jtdx-project/jtdxhamlib'
license=('GPL2')
depends=('libusb-1.0.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jtdx-project/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('a0d2fc31d7cbbaf49286897727884d63')
sha1sums=('518bad18e8bd0e74fa04fd38cbd944b50a1cb79b')
sha224sums=('c0b089d4b23e9bf348016633a7ea3385e0ab755ecfed7061c77f65f9')
sha256sums=('42c55e83a89d058e614ad2803a6ceb9cef329647872b147412f80f676bae8a51')
sha384sums=('eed9564915d658a4f5bb1a5559ac50e44a6db6280dfb75ecb2a663be6b8f4d026a6c8073c2a108dcbb9f84a44365d438')
sha512sums=('0a8d0379e3ca9aa624c9914953fee691fdaedbbbd0eeeac2f39907197959d0d50abc2a109ffd01817044c6111da687480834c9096a057911fb8045f714e6b270')
b2sums=('27c6f05c548de63b9cf1c0a828ecdec4e54d80e31705328a42f0092f7db9a5a5e392481da90ccbdb4712eab9341d9d6d26329c426496236a0dd9023dbd81365c')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./bootstrap
}

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  ../configure \
    "--prefix=/opt/${pkgname}" \
    --disable-shared \
    --enable-static \
    --without-cxx-binding \
    --disable-winradio
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
