# $Id$
# Maintainer: Benjamin Robin <dev@benjarobin.fr>

pkgname=eclipse-subversive
pkgver=3.0.1.I20150722_1700
pkgrel=1
pkgdesc="Eclipse plug-in that provides Subversion support."
arch=('any')
url="http://www.eclipse.org/subversive/"
license=('EPL')
depends=('eclipse')
source=("http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/subversive/3.0/builds/Subversive-${pkgver//_/-}.zip")
md5sums=('a725511ac2cb191277fdb4c625e15f85')

package()
{
	_dest="${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse"
	cd "$srcdir"

	# Features
	find features -type f -name "*.jar" | while read feature ; do
		install -dm755 ${_dest}/${feature/.jar}
		cd ${_dest}/${feature/.jar}
		jar xf ${srcdir}/${feature} || return 1
	done

	# Plugins
	find plugins -type f -name "*.jar" -exec install -Dm644 {} ${_dest}/{} \;
}

