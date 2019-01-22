# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Earnest <zibeon@gmail.com>

pkgname=spin
pkgver=6.4.9
pkgrel=1
pkgdesc='Tool for the formal verification of distributed software systems'
arch=('i686' 'x86_64')
url='https://spinroot.com/'
license=('custom:BSD3')
depends=('glibc')
optdepends=('tcl: ispin graphical interface'
            'swarm: improved performance on large verification problems'
            'modex: extract verification models from implementation C code'
            'ispin: GUI for Spin')
source=(https://github.com/freswa/spin/archive/v${pkgver}.tar.gz)
sha512sums=('0a69001de2f16815a804f5c8df214ca93f5f47b5e5fcd9335191b4daaff56e4cbe3ec39d797b58de35cc0eda564cb21fbf8ba3c83acc02ea2aedb876c736712f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/Src${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/Src${pkgver}"
  # install binary and license file
  install -Dm755 spin "${pkgdir}/usr/bin/spin"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  cd "${srcdir}/${pkgname}-${pkgver}"
  # install manpage and docs
  install -d "${pkgdir}/usr/share/man/man1/"
  install -d "${pkgdir}/usr/share/doc/${pkgname}/examples"

  gzip -9c Man/spin.1 > "${pkgdir}/usr/share/man/man1/spin.1.gz"
  cp -a Examples/* "${pkgdir}/usr/share/doc/${pkgname}/examples/"
}
