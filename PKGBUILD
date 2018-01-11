# Maintainer: Joaquin Garmendia <joaquingc123@gmail.com>

pkgname=droidbot-git
_pkgname=droidbot
pkgver=1.0.2b1.r142.gcc0ec52
pkgrel=1
pkgdesc="A lightweight test input generator for Android"
arch=("any")
url="https://github.com/honeynet/${_pkgname}"
license=('MIT')
depends=('python2' 'python2-pillow' 'python2-networkx' 'python2-decorator'
         'python2-androguard' 'android-tools' 'android-udev')
makedepends=('python2-setuptools' 'git') 
optdepends=('opencv: to run droidbot in cv mode'
            'android-sdk: for developers'
            'android-platform-tools: for developers'
            'jdk9-openjdk: for developers')
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
	cd ${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${_pkgname}
	python2 setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	mkdir "${pkgdir}/usr/lib/python2.7/site-packages/${_pkgname}/resources"
	cp -R ${_pkgname}/resources/{stylesheets,minicap,index.html} "${pkgdir}/usr/lib/python2.7/site-packages/${_pkgname}/resources"
}
