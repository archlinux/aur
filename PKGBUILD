# Maintainer: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgbase=scala-dotty
pkgname=('scala-dotty' 'scala3')
pkgver=3.0.1
pkgrel=1
pkgdesc='The Scala 3 compiler, also known as Dotty.'
arch=('any')
url='http://dotty.epfl.ch'
license=('Apache')
depends=('java-environment>=8')
source=("https://github.com/lampepfl/dotty/releases/download/${pkgver}/scala3-${pkgver}.tar.gz")
sha1sums=('13bf787156bdd2541d809c5d42669b3baa8d0a1c')
sha256sums=('440a897eb41f1aa478892bfda60f8bba54e83dcdc63a3be93ad4a887dbaae090')
b2sums=('a26a9182d22d262896ce6899e53bd3b9e5d63998100fd067ee70509437add9951e8640be90276969ebfbb5982306cdc7057874f59ce7a7a1059b4844b93012c8')

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
