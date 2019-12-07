# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Earnest <zibeon@gmail.com>

pkgname=spin
pkgver=6.5.2
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
sha512sums=('ff1d378076995fa5a8b66dd31d19d8bad6296b968183180251d267c926c20775edda927a31f466199e01231f6233c3a5166fd51ec44b02d570070e857d8ba7f9')

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
