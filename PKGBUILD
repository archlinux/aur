# Maintainer: Saed Ahmed <itsaed7@gmail.com> 
# Contributor: robertfoster
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: RaNaN <ranan@pyload.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: prophy <4prophy@gmail.com>
# Contributor: carstene1ns <carsten.1 gmx net>
pkgname='pyload-git'
pkgver=v0.4.9.r4238.g24782b8c0
pkgrel=19
pkgdesc="Downloadtool for One-Click-Hoster written in python. Latest stable branch"
url="https://github.com/pyload/pyload"
license=('GPL')
arch=('any')
provides=('pyload')
conflicts=('pyload' 'pyload-hg')
backup=('var/lib/pyload/pyload.conf')
depends=('python2' 'python2-crypto' 'python2-pycurl' 'tesseract'
'python2-imaging' 'python2-pyopenssl')
optdepends=('python2-pyqt: Gui'
	'python2-flup: for additional webservers'
	'python2-notify: Notifications for GUI'
'js: ClickNLoad')
makedepends=('git')
install='pyload-git.install'

source=('pyload::git+https://github.com/pyload/pyload.git#branch=stable'
	'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/applications/pyload-gui.desktop'
	'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/applications/pyload.desktop'
	'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/pixmaps/pyload-gui.png'
	'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/pixmaps/pyload.svg'
'pyload.service' 'pyload.conf' 'pyLoadCore' 'pyLoadCli' 'pyLoadGui')

pkgver() {
	cd pyload
	git describe --long --tags| sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd ${srcdir}
	sed -i 's_#!/usr/bin/env python$_#!/usr/bin/env python2_' pyload/pyLoad*.py
}

build() {
	python2 -O -m compileall ${srcdir}/pyload
}

package() {
	cd ${srcdir}

	install -d -m 755 ${pkgdir}/opt/pyload
	cp -r pyload/* ${pkgdir}/opt/pyload

	install -d -m 755 ${pkgdir}/usr/share/applications
	install -D -m 644 pyload.desktop ${pkgdir}/usr/share/applications
	install -D -m 644 pyload-gui.desktop ${pkgdir}/usr/share/applications

	install -d -m 755 ${pkgdir}/usr/share/pixmaps
	install -D -m 644 pyload.svg ${pkgdir}/usr/share/pixmaps
	install -D -m 644 pyload-gui.png ${pkgdir}/usr/share/pixmaps

	install -d -m 755 ${pkgdir}/usr/bin
	install -D -m 755 pyLoadCore ${pkgdir}/usr/bin/pyLoadCore
	install -D -m 755 pyLoadCli ${pkgdir}/usr/bin/pyLoadCli
	install -D -m 755 pyLoadGui ${pkgdir}/usr/bin/pyLoadGui

	# Create PyLoad service
	install -D -m 644 ${srcdir}/pyload.service ${pkgdir}/usr/lib/systemd/system/pyload.service
	install -D -m 644 ${srcdir}/pyload.conf ${pkgdir}/var/lib/pyload/pyload.conf
}

md5sums=('SKIP'
	'b96a4e5091463b3b7fd79208623f1a3a'
	'c67462993d27d5884677dd6e8a8a17d2'
	'73fcec930d25a49e1b99576069d88bd5'
	'649d5af94101655d37fe50e7b127d1b6'
	'454e974b11ab31533423f336c3a182f2'
	'32b00d50be868c165930c592b99730a9'
	'6d764666ec89ce218cd00164e73e0989'
	'6fc2f343d2f324a66745524bbab93e5c'
'806a22a74e8331dffcb8538182e4df2c')
