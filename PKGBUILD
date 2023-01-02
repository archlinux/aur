# Contributor: noonov <noonov@gmail.com>
# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=nkf-git
_pkgname=nkf
pkgver=v2_1_5.r21.ga937062
pkgrel=1
pkgdesc="A yet another kanji code converter among networks, hosts and terminals"
arch=('x86_64' 'i686')
url="https://github.com/nurse/nkf"
license=('custom')
depends=('glibc')
makedepends=('git')
conflicts=('nkf')
source=(git+https://github.com/nurse/nkf
        LICENSE)
b2sums=('SKIP'
        '8b5adf9bc651035873ec70e810bb39e23ee0a99d9949ad3d3b83a766c5e694b88d6e77b24960e3e8ec73fa47cf40750579fc25ba8277c4d723cfeff6efec6f28')

pkgver(){
    cd $srcdir/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}
  sed -i "/^CFLAGS/s|$| $CFLAGS|" Makefile
  make
  ./nkf -w --overwrite nkf.1j
}

package() {
  cd ${srcdir}/${_pkgname}
  install -D -m755 nkf               "${pkgdir}/usr/bin/nkf"
  install -D -m644 nkf.1             "${pkgdir}/usr/share/man/man1/nkf.1"
  install -D -m644 nkf.1j            "${pkgdir}/usr/share/man/ja/man1/nkf.1"
  install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/nkf/LICENSE"
}
