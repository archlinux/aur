# Maintainer: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgbase=scala-dotty
pkgname=('scala-dotty' 'scala3')
_reltag=3.0.0-M1
pkgver=${_reltag//-/}
pkgrel=1
pkgdesc='Research compiler that will become Scala 3'
arch=('any')
url='http://dotty.epfl.ch'
license=('Apache')
#depends=('java-environment>=8' 'java-environment<=11')
depends=('java-environment>=11')
source=("https://github.com/lampepfl/dotty/releases/download/${_reltag}/scala3-${_reltag}.tar.gz")
sha1sums=('4c796383b0fa0534b61434336062f8526d874e79')
sha256sums=('a231276ac330928080f73afc27a61ea2a53a70a75ad91dcf97ad2fba6e27c134')
sha512sums=('a2f7af9155873c9765d9c57df1bdf3d4a9297f8ee5d02df7fa6e7f84106b9fb42312f76134e98160c899ff94b2a31cc23fb9045840f773c33277e1b8ccd7c278')

package_scala-dotty() {
	msg2 "WARNING: These binaries require Java 11 or later."

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
	provides=(scala=$pkgver)
	conflicts=(scala)
	depends=(scala-dotty)

	install -d "${pkgdir}/usr/bin"

	# Symlink scala -> scala3, etv.
	ln -s scalac3 "${pkgdir}/usr/bin/scalac"
	ln -s scalad3 "${pkgdir}/usr/bin/scalad"
	ln -s scala3  "${pkgdir}/usr/bin/scala"
}
