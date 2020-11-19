# Maintainer: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgbase=scala-dotty
pkgname=('scala-dotty' 'scala3')
_reltag=3.0.0-M1
pkgver=${_reltag//-/}
pkgrel=2
pkgdesc='The Scala 3 compiler, also known as Dotty.'
arch=('any')
url='http://dotty.epfl.ch'
license=('Apache')
depends=('java-environment>=8')
source=("https://github.com/lampepfl/dotty/releases/download/${_reltag}/scala3-${_reltag}.tar.gz")
sha1sums=('72fd39d697524d5e129a7793ca21fce0cea0cbd9')
sha256sums=('3e92c7f72779a645af61fdd63da3f4073518ed3471e26aec553a6d858c1387d1')
sha512sums=('c074b821a315722066f6f11b9931361b4e4e8923f2f8ca3f3e58a85b6fe8b2abef159770ae377a3d1520d6704723a3230c9ee8d19e47a8b4593163cac1bfa54d')

package_scala-dotty() {
	install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/scala3/bin"
	cp -r "${srcdir}/scala3-${_reltag}/lib" "${pkgdir}/usr/share/scala3"
	install -m755 "${srcdir}/scala3-${_reltag}/bin/"* "${pkgdir}/usr/share/scala3/bin"

	# Scala 3 symlinks in /usr/bin
	ln -s "../share/scala3/bin/scala"  "${pkgdir}/usr/bin/scala3"
	ln -s "../share/scala3/bin/scalac" "${pkgdir}/usr/bin/scalac3"
	ln -s "../share/scala3/bin/scalad" "${pkgdir}/usr/bin/scalad3"

	# Provide dotty simlinks for convenience
	ln -s scala3  "${pkgdir}/usr/bin/dotr"
	ln -s scalac3 "${pkgdir}/usr/bin/dotc"
	ln -s scalad3 "${pkgdir}/usr/bin/dotd"
}

package_scala3() {
	# In the future scala-dotty will be renamed scala3
	provides=(scala=$pkgver)
	conflicts=(scala)
	depends=(scala-dotty)
	pkgdesc='Symlinks for using Scala 3 instead of Scala 2.'

	install -d "${pkgdir}/usr/bin"

	# Symlink scala -> scala3, etc.
	ln -s scalac3 "${pkgdir}/usr/bin/scalac"
	ln -s scalad3 "${pkgdir}/usr/bin/scalad"
	ln -s scala3  "${pkgdir}/usr/bin/scala"
}
