# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=eclipse-rtmtools
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenRTM-aist tools to manipulate RT components in real-time using a graphical interface"
arch=('i686' 'x86_64')
url="http://www.openrtm.org"
license=('GPL')
depends=('eclipse-emf' 'eclipse-gef')
optdepends=('openrtm-aist: Compilation of C++ components'
            'openrtm-aist-java: Compilation of Java components'
            'openrtm-aist-python: Compilation of Python components')
source=(http://www.openrtm.org/pub/OpenRTM-aist/tools/1.0.0/rtmtools100release_en.zip)
md5sums=('e1051282f79dd8a2618ad993e92063ce')

build() {
	_dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

	cd ${srcdir}

	# Features
	find features -type f | while read _feature ; do
		if [[ ${_feature} =~ (.*\.jar$) ]] ; then
			install -dm755 ${_dest}/${_feature%*.jar}
			cd ${_dest}/${_feature/.jar}
			jar xf ${srcdir}/${_feature} || return 1
		else
			install -Dm644 ${_feature} ${_dest}/${_feature}
		fi
	done

	# Plugins
	find plugins -type f | while read _plugin ; do
		install -Dm644 ${_plugin} ${_dest}/${_plugin}
	done
}

