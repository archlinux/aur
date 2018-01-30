# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=droidbot-git
_pkgname=droidbot
pkgver=1.0.2b1.r146.gea838a9
pkgrel=2
pkgdesc="A lightweight test input generator for Android"
arch=("any")
url="https://github.com/honeynet/${_pkgname}"
license=('MIT')
depends=('python2' 'python2-pillow' 'python2-networkx' 'python2-decorator'
         'python2-androguard' 'android-tools' 'android-udev')
makedepends=('python2-setuptools' 'git') 
optdepends=('opencv: to run droidbot in cv mode'
            'android-sdk: for developers'
            'android-sdk-platform-tools: for developers'
            'jdk9-openjdk: for developers')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}")
sha256sums=('SKIP')
options=('!strip')

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
}
