# Maintainer: Hurstel Alexandre <a.hurstel at unistra dot fr>
pkgname=xp-pen-tablet
pkgver=20210113
pkgrel=2
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('GPL')
source=("https://download01.xp-pen.com/file/2021/01/XP-PEN_3.0.5.201126-1.x86_64.zip"
        "pentablet.sh.patch"
)
sha256sums=('7b5192a762f804e381342d4c3475e6041ffbb8f609fbaed9e5a602741106755a'
    '8d0539c48ddb2cce8c5e9e7ba2f2f1a506c65b3ca96cc412f20529555a63d6a3'
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
