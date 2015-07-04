# Maintainer: Dave Reisner <d@falconindy.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=bash3
_patchlevel=057
pkgver=3.2.$_patchlevel
pkgrel=3
pkgdesc="The GNU Bourne Again shell. Version 3.2. Binary and manpage only."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/bash/bash.html"
depends=('readline' 'glibc')
source=("http://ftp.gnu.org/gnu/bash/bash-3.2.tar.gz"
        $(printf 'http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-%03d ' {1..51}))
md5sums=('00bfa16d58e034e3c2aa27f390390d30'
         'd8e10c754f477e3f3a581af566b89301'
         'd38a5288b2f0ea6c9ac76b66cc74ef7d'
         '0b90d37911827d8cb95f3b4353cc225e'
         '8062f3a59631f58d78b180d83759b68a'
         '585b5943fadf0875ced243b245adde58'
         '1d5732e01ea938aeed42f3def131fa4d'
         'dcd0cc5d801607827f7c851e72b0eabc'
         'bb3c7dd11198c0ab93d0e960bebf6256'
         '434a6f29b0ca5f1ab784b2437ae8eaed'
         '2efff04dd246fcf63bd4b99f77c9a081'
         '1dd104342f6920dfaf5efb3131e922e0'
         '4f24b696ab78bdfae4f9cb7eb59b835d'
         '7c40addbf1187a26ae1c8373ed383442'
         '28e88c9f8679e99ac590d4a4a8227c56'
         '7c17d29675bd0d49470f162774385f80'
         'a1edaa98b4449fe2205fa75448b7b105'
         '889ed119bbf9d363660b9a0127f35efa'
         'a7d3f85fa687d2c1b5a134839f6d395d'
         'f0399da4007e46fc5820ce25d07425b9'
         'b76602281c3104d904fd064510fe0c21'
         '923374ae4403c92820f711e62e1d01a5'
         'c82d3bd14e373878b2a680dce18d1596'
         '987c949a77b4b0ffe4a2597141e77635'
         '5a2b976e761ab83f0fc7daae11451b86'
         '08668dc2825f65eced9cac6b09ce1b45'
         'f35b2b217f088ff009f956894550d41d'
         'b5ff2b9610c61290f773c4b02cc1a37d'
         '016f5b56c93404d32aea09385f0fc13e'
         'a81420626d4d88d0dce2ffac0ac56341'
         '11f91baf970c132949f9072ee93f2ea6'
         'f6bbc1e8ec0246740731c728ef476191'
         '8180ec936770579bce69f0816c2dd878'
         '3cec33c3711860c4c6b7614afeec7870'
         '7bc6c5b5f38b7027152f8db0458a2e14'
         'a2db61fe90e39371d0e6cd2285ec9208'
         '95c70c7ae9de5bd3659c86284be7fb76'
         '62b876a3d7cd192cc8db2476fbb6b7b9'
         'aca3afc341bd3e5a0d8a3b4ca40dbb3f'
         'e240c34f979b64bcb83c5f6567110bb1'
         '06e6df263398807fa032707fb7b77b5f'
         '373ae081d658dc85bc1058c4759d6669'
         '9c9ebc6bfc33a0215277ee17a276eb5a'
         'b87fb9ea16a64ca41b6676e9a7eb7a33'
         '07e0229ce5879bfbd26a8146070fd366'
         '1ad07965a8a93f3556ee1ab18b97cde2'
         'f7b1e19fcad54c2286bc0ed614aad9bf'
         '550690766de770116c34dbdf74e59184'
         '4cc593e7b789b23b37a5397e092d3954'
         'af571a2d164d5abdcae4499e94e8892c'
         '8443d4385d73ec835abe401d90591377'
         '15c6653042e9814aa87120098fc7a849')

build() {
  cd "$srcdir/bash-3.2"
  for p in ../bash32-*; do
    msg "applying patch $p"
    patch -Np0 < "$p"
  done

  ./configure --prefix=/usr --with-curses --enable-readline \
    --without-bash-malloc --with-installed-readline
  make
}

check() {
  cd "$srcdir/bash-3.2"

  make check
}

package() {
  install -Dm755 "$srcdir/bash-3.2/bash" "$pkgdir/usr/bin/bash3"
  install -Dm755 "$srcdir/bash-3.2/doc/bash.1" "$pkgdir/usr/share/man/man1/bash3.1"
}
