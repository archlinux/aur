# Maintainer: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgbase=scala-dotty
pkgname=('scala-dotty' 'scala3')
pkgver=3.0.2
pkgrel=1
pkgdesc='The Scala 3 compiler, also known as Dotty.'
arch=('any')
url='http://dotty.epfl.ch'
license=('Apache')
depends=('java-environment>=8')
source=("https://github.com/lampepfl/dotty/releases/download/${pkgver}/scala3-${pkgver}.tar.gz")
sha1sums=('0b4d4743bae5307b7113c9a0ae37fe4b19cd0f0c')
sha256sums=('136453bde7932c76a3c3530e0063329a4ce7c08fe5099554faa2aef17174cc60')
b2sums=('bbd8af339b358939a5d80f7819c6f77fa3a4e0b554444a3a67d68088f13b16a09aebc4b0488c251fe01c9d0f9c8363c0690bb76ac3074ba9f5d2352132fad53b')

package_scala3() {
	install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/scala3/bin"
	cp -r "${srcdir}/scala3-${pkgver}/lib" "${pkgdir}/usr/share/scala3"
	install -m755 "${srcdir}/scala3-${pkgver}/bin/"* "${pkgdir}/usr/share/scala3/bin"

	# Scala 3 symlinks in /usr/bin
	ln -s "../share/scala3/bin/scala"  "${pkgdir}/usr/bin/scala3"
	ln -s "../share/scala3/bin/scalac" "${pkgdir}/usr/bin/scalac3"
	ln -s "../share/scala3/bin/scalad" "${pkgdir}/usr/bin/scalad3"
}

package_scala-dotty() {
	depends=(scala3)

	install -d "${pkgdir}/usr/bin"

	# Provide dotty simlinks for convenience
	ln -s scala3  "${pkgdir}/usr/bin/dotr"
	ln -s scalac3 "${pkgdir}/usr/bin/dotc"
	ln -s scalad3 "${pkgdir}/usr/bin/dotd"
}
