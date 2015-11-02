# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Pierre Chapuis <catwell@archlinux.us>

pkgname=spin
pkgver=6.4.4
pkgrel=2
pkgdesc='Tool for the formal verification of distributed software systems.'
arch=('i686' 'x86_64')
url='http://spinroot.com/'
license=('custom:SPIN')
depends=('glibc')
source=("http://spinroot.com/spin/Src/spin${pkgver//./}.tar.gz"
        'LICENSE.txt')
sha512sums=('cd16613e6bde57dd968a126b9159e28a44ad5698dd20d9b2b542c6be9b79cbfbbc0b6b3c5dfcf3aac11dfa244ad95583fe914899dde3cf685bc6e1fdcd058cea'
            'a5b63fc7136a2631c9a27619953abe2e9d6cab179042dd56bb76afbffe1966ad7edb41a131af5d6663f3cdbf77128833232e9174c0ef817b8522bfd978add595')

build() {
  cd ${srcdir}/Spin/Src${pkgver}
  make
}

package() {
  cd ${srcdir}/Spin/Src${pkgver}

  # install binary and license file
  install -D spin ${pkgdir}/usr/bin/spin
  install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  
  # install manpage
  install -d ${pkgdir}/usr/share/man/man1/  
  gzip -9c ${srcdir}/Spin/Man/spin.1 > ${pkgdir}/usr/share/man/man1/spin.1.gz
}
