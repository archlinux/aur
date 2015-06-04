# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=alice
_realname=Alice
pkgver=2.4.2
pkgrel=2
pkgdesc="An educational software that teaches students computer programming in a 3D environment"
arch=('i686' 'x86_64')
url="http://www.alice.org/"
license=("custom")
depends=('bin32-jre' 'lib32-mesa')
options=(!emptydirs)
source=("http://www.alice.org/downloads/2.4/${_realname}${pkgver//.2/}.tar.gz" \
  "${pkgname}" \
  "${pkgname}.png" \
	"${pkgname}.desktop" \
	"LICENSE")
sha512sums=('55ce61d45ca08364f2476134de87bac54dba755444d8d86bb13c7bd280a6dfcf12b40e6ed12c2c0b0c8b011e4703c73fea43e99cd29ba87c3ceb5188989a9013'
            'b92998c9baffc9b0a766c649fe52b2c63a88d752cc73d8d65e051783b090b307932135024672162392ba7c0b49f4c3269111b9e9f3b6e62806781c547b22529d'
            '7d3473033a44b964c7a25f7387363a76fe3cccccc18732f72c6308b43c79dd7f2a546465e35fbd8625e5d68287f54807a1a2d29b9ed67793b9cc5a3f24261264'
            '8db4e9a8c2221b26dc9c0ce850206c9646b343cc839c46d9a21e43f87e0298cac97a1a362f22bdbef2d05329fb7c9662d6575560bc30c2cac9e304093cb881ba'
            '7cf223bcdfb4929c4c4f89ccbd14a49101c742e646a841d64eee6dd7b4c8c4917e0ab7e3bd59e800e4eb3ab266b3fc4312df7b4deb448504ce021af79b4cd1eb')

prepare()
{

echo -n 'python.cachedir='"${HOME}"'/.jython-cache' >> ${srcdir}/${_realname}\ ${pkgver//.2/}/Required/jython-2.1/registry

}

package()
{
	cd ${srcdir}/${_realname}\ ${pkgver//.2/}/Required

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
