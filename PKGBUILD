# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Patches from phalanx @ openSUSE build service

pkgname=phalanx
pkgver=23
_mypkgver=XXIII
pkgrel=3
pkgdesc="A chess engine which understands the xboard protocol. It's suitable for beginner and intermediate players"
url="http://phalanx.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('xboard: to be able to use the xboard graphical frontend')

source=("http://downloads.sourceforge.net/sourceforge/$pkgname/phalanx-${_mypkgver}-beta.tgz"
        "phalanx-23.diff"
        "phalanx-castling-broken.patch")
md5sums=('74393533dab14b95ce8414072c913bc0'
         '175491780d998dfb55d4315c3df0623d'
         '9b60d4fbad709aad8ca0e9ff655b9da6')
sha512sums=('39e09a8ddee85b60b79628e20268cafce28596ea47fdf7c61d396a7da4ef0dce6060168eb98a4794c4bc96484c0d6d82475dd1c20e8dc3546dd2ca857873af2c'
            '874d632efa3564f75a5534d0b2cb696e72b6a94e118e85dd590a1a79860ee1c18faa75da22df73d5774144661c3cb55ab8b9484a1a48bca76b954e484d8d3bcd'
            'f7b007ee952fe96a26da433845e3b6babae78d1ed6a70e41d07ef213a9f008b920c715033d44f6d4d11a7771e7b5dd653877f55b918b954b68062cf166ad0d08')

prepare () {
   # Use the makepkg CFLAGS set for building phalanx
   cd "${srcdir}"/phalanx-${_mypkgver}
   sed -i "s/CFLAGS = -O0/# CFLAGS = -O0/g" makefile
   # Apply patches
   cd "${srcdir}"/phalanx-XXIII
   patch < "${srcdir}"/phalanx-23.diff
   patch < "${srcdir}"/phalanx-castling-broken.patch
}

build() {
   cd "${srcdir}"/phalanx-${_mypkgver}
   make
}

package () {
   cd "${srcdir}"/phalanx-${_mypkgver}
   install -t "${pkgdir}"/usr/bin -D {x,}phalanx
   install -t "${pkgdir}"/usr/share/phalanx -D -m0644 eco.phalanx pbook.phalanx sbook.phalanx
}
