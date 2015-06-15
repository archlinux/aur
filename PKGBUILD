pkgname=id3lib_debian_patches
_realname=id3lib
pkgver=3.8.3
pkgrel=1
pkgdesc="Open-source, cross-platform software development library for reading, writing, and manipulating ID3v1 and ID3v2 tags"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://id3lib.sourceforge.net/"
depends=('zlib' 'gcc-libs')
provides=('id3lib')
conflicts=('id3lib')
source=("http://downloads.sourceforge.net/sourceforge/id3lib/id3lib-${pkgver}.tar.gz"
        '00-add-libz-to-compilation.patch'
        '05-create-m4-directory.patch'
        '10-fix-compilation-with-cpp-headers.patch'
        '10-foo-with-configure.in.patch'
        '15-fix-headers-of-main-functions.patch'
        '20-create-manpages.patch'
        '30-fix-utf16.patch'
        '40-deal-with-mkstemp.patch'
        '50-remove-outdated-check.patch'
        '60-add-c-wrapper-functions.patch'
        '60-fix_make_check.patch'
        '60-id3lib-missing-nullpointer-check.patch'
        '60-spelling.patch'
        '61-fix_vbr_stack_smash.patch')
sha1sums=('c92c880da41d1ec0b242745a901702ae87970838'
         '1c13d98a11e7f062fe25d6bae8ce780c35e2f691'
         '946a27409968a061b2cdade2e677d8f45bdd9d60'
         '3c2b7499066cb001a4843188d8ffdb1f450175b5'
         '3cd2de172d5950f30149d1b5c661f88a4e0f76e6'
         '437816ca21d47d673c7bf94ca5bf9773d6993789'
         '4542d346f0242187b4b79f22e6c413701e39e1bf'
         '7c635c00dbcc3ad914a2bba0858e0c434d8d3a79'
         'a85676f3ba62b85d48af3751561f977d2897838c'
         '017803a6cc1d92c2ac2eba09095ececb456fec72'
         '31ec8f8d31cc31e180c469a3a2102543d47e5daa'
         '3d316681de5cafade6b4d4419587d7ca590c3f90'
         '8f22b1e952fe88b5cdb4cdc5c3fd4b999427c7d2'
         '436a8890798ccca65b223b8e6ab9c058cc357cda'
         '170b78cb3d16a8f302704b90331868e2e0277a42')

prepare() {
  cd ${_realname}-${pkgver}
  patch -p1 -i "${srcdir}"/00-add-libz-to-compilation.patch
  patch -p1 -i "${srcdir}"/05-create-m4-directory.patch
  patch -p1 -i "${srcdir}"/10-fix-compilation-with-cpp-headers.patch
  patch -p1 -i "${srcdir}"/10-foo-with-configure.in.patch
  patch -p1 -i "${srcdir}"/15-fix-headers-of-main-functions.patch
  patch -p1 -i "${srcdir}"/20-create-manpages.patch
  patch -p1 -i "${srcdir}"/30-fix-utf16.patch
  patch -p1 -i "${srcdir}"/40-deal-with-mkstemp.patch
  patch -p1 -i "${srcdir}"/50-remove-outdated-check.patch
  patch -p1 -i "${srcdir}"/60-add-c-wrapper-functions.patch
  patch -p1 -i "${srcdir}"/60-fix_make_check.patch
  patch -p1 -i "${srcdir}"/60-id3lib-missing-nullpointer-check.patch
  patch -p1 -i "${srcdir}"/60-spelling.patch
  patch -p1 -i "${srcdir}"/61-fix_vbr_stack_smash.patch
}
         
build() {
  cd ${_realname}-${pkgver}
  ./configure --prefix=/usr
  sed -i -e 's/^LIBS =/LIBS = -lz -lstdc++/' src/Makefile
  make
}

package() {
  cd ${_realname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
