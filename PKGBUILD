pkgname=id3lib_debian_patches
_realname=id3lib
pkgver=3.8.3
pkgrel=1
pkgdesc="Open-source, cross-platform software development library for reading, writing, and manipulating ID3v1 and ID3v2 tags"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://sourceforge.net/projects/id3lib"
depends=('zlib' 'gcc-libs')
provides=('id3lib')
conflicts=('id3lib')
source=("https://downloads.sourceforge.net/sourceforge/id3lib/id3lib-${pkgver}.tar.gz"
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

sha256sums=('2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079'
            'e884395cf0bd7b44a550fc8785d79c0992d749be1edc45b00d289cbbd179c6d5'
            'c41ec6889b775119f71c25fa09bb5110bcf550a14e6aac80597479df453de5fb'
            '5fb24595095596ff55d876fb3e5277000f04c4f7a3e07aff5c05e11639dc2165'
            '40543583d495508b3e38eeaf72ed2c0ec48736e8cbfb1b091857b9d90b3a7deb'
            '042deb7c2df1afa0851622b6086e8eb4b007cc6cfcd70210852d5c25e39b08b1'
            '22c1b5734b6a34abdbcc25b571acce5a47f514fd129a1312adf14d71d1ac837f'
            'a7cce4176df773677bfc6a527a0465d460fe60a269402af9bdfc9dd6104ea6a4'
            'd7999cdb425ba8013dd11da7fb570e875d368e5b1236c2b094abee8446f04218'
            '88c1cc92aad8fd8a180aa1dd0cc2c0f5f326d6212786d26575cdd26378cf97a8'
            '1b06c5d2c36e6a1f2236c4603a934d8cd675414dcfd52b997cb584404c0bc77d'
            '88aded7423f266d2fedb0eef9dbb272b53cc776ae98bd71dd5afb30b6ac48515'
            '85f20c4d3467f48df1bcaa4150bae55e95270cabb542589f167a914b2f553d04'
            'b31bfa7213325776f6784a684f082814d3affb050d36a7c41cf1b1df07228c5c'
            '5a24d460c9dd1e643ac57b817ea9cec87f44c1d49381065f83879b2eea36adf7')
