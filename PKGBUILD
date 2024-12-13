# Maintainer: envolution
# Contributor: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgbase=scala-dotty
pkgname=(
  'scala-dotty'
  'scala3'
)
pkgver=3.6.2
pkgrel=4
pkgdesc='The Scala 3 compiler, also known as Dotty.'
arch=('any')
url='http://dotty.epfl.ch'
license=('Apache-2.0')
depends=('java-environment>=8')
source=("https://github.com/lampepfl/dotty/releases/download/${pkgver}/scala3-${pkgver}.tar.gz")
sha256sums=('690f278f88ff8465dd2e8cd314d6c507ad79fef9533e89051f858c8192b7856d')

package_scala3() {
  cd "${pkgname}-${pkgver}" 
  install -d    "${pkgdir}/usr/bin"
  install -d    "${pkgdir}/usr/share/scala3"
  cp -r "./"*   "${pkgdir}/usr/share/scala3/"
  chmod -R 755  "${pkgdir}/usr/share/scala3/bin/"*

  # Scala 3 symlinks in /usr/bin
  ln -s "../share/scala3/bin/scala"  "${pkgdir}/usr/bin/scala3"
  ln -s "../share/scala3/bin/scalac" "${pkgdir}/usr/bin/scalac3"
  ln -s "../share/scala3/bin/scalad" "${pkgdir}/usr/bin/scalad3"
}

package_scala-dotty() {
  depends+=(scala3)

  install -d "${pkgdir}/usr/bin"

  # Provide dotty simlinks for convenience
  ln -s scala3  "${pkgdir}/usr/bin/dotr"
  ln -s scalac3 "${pkgdir}/usr/bin/dotc"
  ln -s scalad3 "${pkgdir}/usr/bin/dotd"
}
