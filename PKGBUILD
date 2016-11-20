# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libsepol
pkgver=2.6
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64' 'armv6h')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
makedepends=('flex')
depends=('glibc')
options=(staticlibs)
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014/${pkgname}-${pkgver}.tar.gz"
        '0001-libsepol-cil-Check-for-improper-category-range.patch'
        '0002-libsepol-cil-Use-empty-list-for-category-expression-.patch'
        '0003-libsepol-cil-Use-an-empty-list-to-represent-an-unkno.patch'
        '0004-libsepol-cil-Check-if-identifier-is-NULL-when-verify.patch'
        '0005-libsepol-cil-Check-that-permission-is-not-an-empty-l.patch'
        '0006-libsepol-cil-Verify-alias-in-aliasactual-statement-i.patch'
        '0007-libsepol-cil-Verify-neither-child-nor-parent-in-a-bo.patch'
        '0008-libsepol-cil-cil_strpool-Allow-multiple-strpool-user.patch'
        '0009-libsepol-Add-symver-with-explicit-version-to-build-w.patch'
        '0010-libsepol-cil-Exit-with-an-error-for-an-unknown-map-p.patch'
        '0011-libsepol-sepol_-bool-iface-user-_key_create-copy-nam.patch'
        '0012-libsepol-cil-remove-double-free.patch'
        '0013-libsepol-fix-checkpolicy-dontaudit-compiler-bug.patch'
        '0014-libsepol-test-for-ebitmap_read-negative-return-value.patch')
sha256sums=('d856d6506054f52abeaa3543ea2f2344595a3dc05d0d873ed7f724f7a16b1874'
            'bf91f6ba2b8f48c927ac57d6a6b981931ce7b4450fe1d6500ea2c803c4e56626'
            'e92e97c35bb08831b08be75a35e7580d5aec5890ac3045300834d42c632b1dfd'
            'b454ca0b8cad91832d72a3aa2bb0e2a918ed83a64b569e61b8206b33956be1d8'
            'f609c47c156eb9dfa5d9e6de974bec53468f413d3b930730dafe2f5d2e50d108'
            '99d0e405a1c1502193ee9f794f0694d6e0e9a6b8fdc3ce4848fb2677063b1060'
            'efc08e8c2ccf15004633d909f2eaab69b44329000eae66ef5489b02b6c87d957'
            'c90ffac363835b1c446834a79a71128a35ab4a9250b2277acbb21995e039bbf4'
            '188836eb7511ae7cad1d7c4113c66632f37eeb81f91774d3baa83dd73217cb80'
            '3958e086522aa0a51ee102b4a2b0c9e9430228e13c31eebaab889a0481e01c03'
            '8abcd9786d3c87c17e93a186b798a6bf3b41a9835a729545cf47421c29afe3ea'
            '92b5867df062dbc0bdc9ef10c14bf04e38bcf41d000a08b9694d61aa3a10fbe3'
            '99c6c385bbed2955eeba2d20688857c93b37ad63599e461c476d0c8c9e2c5cd8'
            'ff189419f3c491b10c88cf2779936084cbf66cd6b89ed3118f3656660ebf2fcd'
            '067a50c52556b4c6f346bb1dc7ba6d6c916c921aea11835ab0b79ed2332d1faf')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np2 -i '../0001-libsepol-cil-Check-for-improper-category-range.patch'
  patch -Np2 -i '../0002-libsepol-cil-Use-empty-list-for-category-expression-.patch'
  patch -Np2 -i '../0003-libsepol-cil-Use-an-empty-list-to-represent-an-unkno.patch'
  patch -Np2 -i '../0004-libsepol-cil-Check-if-identifier-is-NULL-when-verify.patch'
  patch -Np2 -i '../0005-libsepol-cil-Check-that-permission-is-not-an-empty-l.patch'
  patch -Np2 -i '../0006-libsepol-cil-Verify-alias-in-aliasactual-statement-i.patch'
  patch -Np2 -i '../0007-libsepol-cil-Verify-neither-child-nor-parent-in-a-bo.patch'
  patch -Np2 -i '../0008-libsepol-cil-cil_strpool-Allow-multiple-strpool-user.patch'
  patch -Np2 -i '../0009-libsepol-Add-symver-with-explicit-version-to-build-w.patch'
  patch -Np2 -i '../0010-libsepol-cil-Exit-with-an-error-for-an-unknown-map-p.patch'
  patch -Np2 -i '../0011-libsepol-sepol_-bool-iface-user-_key_create-copy-nam.patch'
  patch -Np2 -i '../0012-libsepol-cil-remove-double-free.patch'
  patch -Np2 -i '../0013-libsepol-fix-checkpolicy-dontaudit-compiler-bug.patch'
  patch -Np2 -i '../0014-libsepol-test-for-ebitmap_read-negative-return-value.patch'
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install
}
