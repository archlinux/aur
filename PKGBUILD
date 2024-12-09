_pkgname=adbenq
pkgname=adbenq-git
pkgver=v0.1.8.r12.gcbb16d3
pkgrel=1
pkgdesc="Control your BenQ TV like a boss 🖥️✨ "
url="https://github.com/Zarox28/ADBenQ"
license=("AGPLv3")
arch=('any')
depends=('python' 'python-pip' 'pyside6' 'scrcpy' 'android-tools')
source=("${_pkgname}::git+https://github.com/Zarox28/ADBenQ.git")
sha256sums=('SKIP')


pkgver() {
    cd $srcdir/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/${_pkgname}
    pip install pure-python-adb --break-system-packages
}

package() {
    pwd
	install -Dm 0644 "../adbenq.desktop" "${pkgdir}/usr/share/applications/adbenq.desktop"
    cd "$srcdir/${_pkgname}"
	install -Dm 0644 "src/icons/linux.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/adbenq.png"
	mkdir -p "${pkgdir}/opt/adbenq"
	cp -r . "${pkgdir}/opt/adbenq/"
}

