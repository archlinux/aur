# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=alice
_realname=Alice
pkgver=2.4.3
_pkgver=2_4e
pkgrel=1
pkgdesc="An educational software that teaches students computer programming in a 3D environment"
arch=('i686' 'x86_64')
url="http://www.alice.org/"
license=("custom")
depends=('java-environment' 'mesa')
options=(!emptydirs)
source=("http://www.alice.org/downloads/2.4/${_realname}${_pkgver}.tar.gz" \
  "${pkgname}" \
  "${pkgname}.png" \
	"${pkgname}.desktop" \
	"LICENSE")
sha512sums=('7caf72e0550b3dfcf4a5b15118c495b5267f86ea7e975f692242fc794276c7b98833e6b304f8240d741d15fd33d8397f30d405709af86117ed9bdb5131790664'
            '2401cc32d57a3a531c8670ff97af5151857ea7cf4555dc5c231e9fcc0a3a14b7fd1b1a7b5fd7c141a5bc1d2823ff3aab901e28248be192a15f616434a86d64b2'
            '7d3473033a44b964c7a25f7387363a76fe3cccccc18732f72c6308b43c79dd7f2a546465e35fbd8625e5d68287f54807a1a2d29b9ed67793b9cc5a3f24261264'
            '8db4e9a8c2221b26dc9c0ce850206c9646b343cc839c46d9a21e43f87e0298cac97a1a362f22bdbef2d05329fb7c9662d6575560bc30c2cac9e304093cb881ba'
            '7cf223bcdfb4929c4c4f89ccbd14a49101c742e646a841d64eee6dd7b4c8c4917e0ab7e3bd59e800e4eb3ab266b3fc4312df7b4deb448504ce021af79b4cd1eb')

prepare()
{

echo -n 'python.cachedir='"${HOME}"'/.jython-cache' >> ${srcdir}/${_realname}\ ${pkgver//.3/}/Required/jython-2.1/registry

}

package()
{
	cd ${srcdir}/${_realname}\ ${pkgver/.3/}/Required

	# Directories
	install -d ${pkgdir}/opt/${pkgname}/

	# Application
	cp -r * ${pkgdir}/opt/${pkgname}/
	chmod 755 -R ${pkgdir}/opt/${pkgname}/
  chmod 755 ${pkgdir}/opt/${pkgname}/jython-2.1/

	cd ${srcdir}/

	# Binaries
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

	# Desktop
	install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

	# License
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

