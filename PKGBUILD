# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Earnest <zibeon@gmail.com>

pkgname=spin
pkgver=6.5.1
pkgrel=1
pkgdesc='Tool for the formal verification of distributed software systems'
arch=('i686' 'x86_64')
url='https://spinroot.com/'
license=('custom:BSD3')
depends=('glibc')
optdepends=('tcl: ispin graphical interface'
            'swarm: improved performance on large verification problems'
            'ispin: GUI for Spin')
source=("https://github.com/nimble-code/Spin/archive/version-${pkgver}.tar.gz")
sha512sums=('e852d4a5ba92d58350dc1624e6d204e918e31dd22ce4bf15275390d56a679fee29f0fb662de0a00f7c303b7287357c5a4c11a01ebd178712a9229aa830393a93')

build() {
  cd Spin-version-${pkgver}/Src
  make
}

package() {
  # install binary and license file
  cd Spin-version-${pkgver}/Src
  install -Dm755 spin "${pkgdir}"/usr/bin/spin
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt

  # install manpage and docs
  cd "${srcdir}"/Spin-version-${pkgver}
  install -dm755 "${pkgdir}"/usr/share/man/man1/
  install -dm755 "${pkgdir}"/usr/share/doc/${pkgname}/examples

  install -Dm644 Man/spin.1 "${pkgdir}"/usr/share/man/man1/spin.1.gz
  cp -a Examples/* "${pkgdir}"/usr/share/doc/${pkgname}/examples/
}
