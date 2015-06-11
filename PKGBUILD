pkgname=eclipse-subversive
pkgver=2.0.4.I20150123_1700
pkgrel=1
pkgdesc="Eclipse plug-in that provides Subversion support."
arch=('any')
url="http://www.eclipse.org/subversive/"
license=('EPL')
depends=('eclipse')
source=("http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/subversive/2.0/builds/Subversive-${pkgver//_/-}.zip")
md5sums=('8c73236f7eb6befd39f1394b9e8c5d06')

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

