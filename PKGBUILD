# Maintainer: Lyna Stral <testerthe60@gmail.com>

_pkgname=adbenq
pkgname="$_pkgname"-git
pkgver=v0.2.4.r0.gc68a390
pkgrel=1
pkgdesc="General utility to manage your ANDROID TV. Tailored for BENQ TVs"
url="https://github.com/Zarox28/ADBenQ"
license=("AGPLv3")
arch=('any')
provides=('adbenq')
depends=('python' 'python-pip' 'pyside6' 'scrcpy' 'android-tools' 'python-platformdirs')
makedepends=('git')
source=("${_pkgname}::git+$url")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir"/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/${_pkgname}
    # Currently I do not have any other way to package this dependency, which sucks. Shouldn't break anything tho
    pip install pure-python-adb --break-system-packages
}

package() {
	install -Dm 0644 "../adbenq.desktop" "${pkgdir}/usr/share/applications/adbenq.desktop"
	install -Dm 0655 "../run" "${pkgdir}/usr/bin/adbenq"
    cd "$srcdir/${_pkgname}"
	install -Dm 0644 "src/icons/linux.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/adbenq.png"
	mkdir -p "${pkgdir}/opt/adbenq"
	cp -r . "${pkgdir}/opt/adbenq/"
}
