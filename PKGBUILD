# Maintainer: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgbase=scala-dotty
pkgname=('scala-dotty' 'scala3')
_reltag=3.0.0-M3
pkgver=${_reltag//-/}
pkgrel=1
pkgdesc='The Scala 3 compiler, also known as Dotty.'
arch=('any')
url='http://dotty.epfl.ch'
license=('Apache')
depends=('java-environment>=8')
source=("https://github.com/lampepfl/dotty/releases/download/${_reltag}/scala3-${_reltag}.tar.gz")
sha1sums=('1052ab812daff674089207406195392431a913f9')
sha256sums=('1ca46231ee8abea770c1328c99010475efa9f2be5faf5c5ce9b8fb8c40345f94')
sha512sums=('e309036079364d7760227c30df9196ab0cdb1fa2085ebc801592c3af2eb4f87b0194f1cfb8c2aaac2e6b7d128a2bdc218ed5cefda89e241a15412a12eecc3500')

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
