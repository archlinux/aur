# Maintainer:
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=dico
pkgver=2.12
pkgrel=1
pkgdesc="GNU Dictionary Server"
arch=('x86_64')
url="https://www.gnu.org.ua/software/dico/"
license=('GPL-3.0-or-later')
depends=('bash'
         'gc'
         'glibc'
         'gsasl'
         'guile'
         'libldap'
         'libtool'
         'libxcrypt'
         'pam'
         'pcre2'
         'python'
         'readline'
         'wordnet-progs'
         'zlib')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig}
        "https://sources.debian.org/data/main/d/dico/2.12-3/debian/patches/int-conversion.patch")
sha256sums=('728b89c50e090bff839e8f7b3043b5c7023f861a9211c93048b42ab455866af7'
            'SKIP'
            '512711ca82a750c82be935b555f72af1834f622ac8845f8e86edebc657a83d7e')
validpgpkeys=('4BE4E62655488EB92ABB468F79FFD94BFCE230B1') # Sergey Poznyakoff <gray@gnu.org.ua>

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i ../int-conversion.patch
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/bin \
        --with-libWN=wordnet
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
