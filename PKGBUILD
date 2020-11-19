# Maintainer: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgbase=scala-dotty
pkgname=('scala-dotty' 'scala3')
_reltag=3.0.0-M2
pkgver=${_reltag//-/}
pkgrel=1
pkgdesc='The Scala 3 compiler, also known as Dotty.'
arch=('any')
url='http://dotty.epfl.ch'
license=('Apache')
depends=('java-environment>=8')
source=("https://github.com/lampepfl/dotty/releases/download/${_reltag}/scala3-${_reltag}.tar.gz")
sha1sums=('99139c746d5e61aed7ca5268630e11c0ab97d16f')
sha256sums=('ec71104112749d0efdf1127f9c2ce9722f732181518be7e983a9f754a698c281')
sha512sums=('d42fd39e12677aae702b50642a656b25cb9b5e34f325bb0d3d603d5b1836ecd2e5fa29b60143b0b3ac82aeaf880b9464f0645501ec90dccba4b2b81cf4eee672')

package_scala3() {
	install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/scala3/bin"
	cp -r "${srcdir}/scala3-${_reltag}/lib" "${pkgdir}/usr/share/scala3"
	install -m755 "${srcdir}/scala3-${_reltag}/bin/"* "${pkgdir}/usr/share/scala3/bin"

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
