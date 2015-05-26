# Contributor: Gary James <garyjames82@gmail.com>
# Contributor: Pablo Lezaeta <prflr88 @ gmail.com>

pkgname=rox-session-git
_pkgname=rox-session
pkgver=0.41.0.r399
pkgrel=1
group=("rox-desktop")
pkgdesc="ROX Filer session manager"
arch=("i686" "x86_64")
url="http://roscidus.com/desktop/ROX_Session"
license=("GPL")
depends=("rox-lib-git" "rox-filer-git" "dbus" "xterm" "dbus-python" "libxtst" "librsvg")
source=("${_pkgname}::git+https://github.com/rox-desktop/ROX-Session.git")

pkgver(){
        cd "${_pkgname}"
        echo "0.41.0.r$(git rev-list --count HEAD | sed 's/-/./g' )"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	 sed -i "s|\(env python\).*|\12|" $(grep -rl "env python" .)
	 sed -i '11,$d' AppRun
}

package() {
	cd "${srcdir}/${_pkgname}"
	rm -R Help
	mkdir -p "${pkgdir}/usr/share/rox-session"
	mkdir -p "${pkgdir}/usr/bin"
	cp -R * "${pkgdir}/usr/share/rox-session"
	cp .DirIcon "${pkgdir}/usr/share/rox-session"
	cd "${pkgdir}/usr/share/rox-session"
	./AppRun --compile
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/rox-session 
	echo "sh /usr/share/rox-session/AppRun" >> "${pkgdir}/usr/bin/rox-session"
	chmod +x "${pkgdir}/usr/bin/rox-session"
}

md5sums=('SKIP')
