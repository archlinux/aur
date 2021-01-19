# Maintainer: Hurstel Alexandre <a.hurstel at unistra dot fr>
pkgname=xp-pen-tablet
pkgver=20210113
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('GPL')
source=("https://download01.xp-pen.com/file/2021/01/XP-PEN_3.0.5.201126-1.x86_64.zip"
        "pentablet.sh.patch"
)
sha256sums=('7b5192a762f804e381342d4c3475e6041ffbb8f609fbaed9e5a602741106755a'
    '82c41a9c900d1011860102673872f79b9ee7370317497880fbae1f6115459ee5'
)

prepare() {
    cd "$srcdir/xp-pen_3.0.5.201126-1.x86_64/App/usr/lib/pentablet"
    
    patch < "$srcdir/pentablet.sh.patch"
}


package() {
	cd "xp-pen_3.0.5.201126-1.x86_64/App"
	
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
    cp lib/udev/rules.d/10-xp-pen.rules ${pkgdir}/usr/lib/udev/rules.d/10-xp-pen.rules

    cd usr
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/{}" \;
}
