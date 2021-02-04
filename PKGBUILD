# Maintainer: Hurstel Alexandre <alexandre at hurstel dot eu>
pkgname=xp-pen-tablet
pkgver=20210203
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('GPL')
source=("https://download01.xp-pen.com/file/2021/02/XP-PEN_Pentablet_3.0.5.201126-2.x86_64.tar.gz.zip"
        "pentablet.sh.patch"
)
sha256sums=('be41cc994331497fcd160f0b4032ac06299d6e45d1b94924a61b0395de5884ed'
    '8d0539c48ddb2cce8c5e9e7ba2f2f1a506c65b3ca96cc412f20529555a63d6a3'
)

prepare() {
    cd "$srcdir"
    tar -xf XP-PEN_Pentablet_3.0.5.201126-2.x86_64.tar.gz

    cd "$srcdir/xp-pen-pentablet_3.0.5.201126-2.x86_64/App/usr/lib/pentablet"
    
    patch < "$srcdir/pentablet.sh.patch"
}


package() {
	cd "xp-pen-pentablet_3.0.5.201126-2.x86_64/App"
	
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
    cp lib/udev/rules.d/10-xp-pen.rules ${pkgdir}/usr/lib/udev/rules.d/10-xp-pen.rules

    cd usr
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/{}" \;
}
