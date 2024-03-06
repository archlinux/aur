# Maintainer: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgbase=scala-dotty
pkgname=('scala-dotty' 'scala3')
pkgver=3.4.0
pkgrel=1
pkgdesc='The Scala 3 compiler, also known as Dotty.'
arch=('any')
url='http://dotty.epfl.ch'
license=('Apache')
depends=('java-environment>=8')
source=("https://github.com/lampepfl/dotty/releases/download/${pkgver}/scala3-${pkgver}.tar.gz")
sha1sums=('b14687a47ebd191c7ea20d0bdd7cfc40dd0ad4b1')
sha256sums=('ec2737b1ed436077d26eda3d02ac49e573011322fc2dcd7fa3ded698a925f416')
b2sums=('020c4cb30736ad0552cf69267f94723e6f7ddcb3430036de52596020671d43d5935db2828a1923a5c023ec3ca33e85a03fc95e20a945b4c45d8408991ab15864')

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
