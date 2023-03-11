# Maintainer: NebulaBC <ufrii.print@nebulabc.net>
pkgname='ufrii-print'
pkgver=1.0
pkgrel=1
pkgdesc="Install the official Canon UFRII/UFRII LT driver made for Debian on ArchLinux"
url="https://www.usa.canon.com/support/p/color-imageclass-mf644cdw"
arch=('x86_64')
depends=('cups'
	'ghostscript'
	'gtk3'
	'libjpeg6-turbo'
	'libgcrypt'
	'libjbig-shared'
	'zlib'
	'wget')

build() {
    wget https://gdlp01.c-wss.com/gds/6/0100009236/15/linux-UFRII-drv-v570-us-11.tar.gz
    tar -xf linux-UFRII-drv-v570-us-11.tar.gz
    cd linux-UFRII-drv-v570-us/x64/Debian
    mv cnrdrvcups-ufr2-us_5.70-1.11_amd64.deb $srcdir
    cd $srcdir
    rm -rf linux-UFRII-drv-v570-us*
    ar x cnrdrvcups-ufr2-us_5.70-1.11_amd64.deb
    rm control.tar.xz debian-binary cnrdrvcups-ufr2-us_5.70-1.11_amd64.deb
    tar -xvf data.tar.xz
    rm data.tar.xz
}

package() {
    cd $srcdir
    mv * $pkgdir
    echo "To open the setup GUI, you can run \`cnsetuputil2\`"
}
