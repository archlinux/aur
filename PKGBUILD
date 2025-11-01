# Maintainer: NebulaBC <ufrii.print@nebulabc.net>
pkgname='ufrii-print'
pkgver=3
pkgrel=1
pkgdesc="Install the official Canon UFRII/UFRII LT driver made for Debian on ArchLinux"
url="https://www.usa.canon.com/support/p/color-imageclass-mf644cdw"
arch=('x86_64')
depends=('cups'
	'ghostscript'
	'gtk3'
	'libjpeg6-turbo'
	'libgcrypt'
	'jbigkit'
	'zlib')

install=install.sh

source=("https://gdlp01.c-wss.com/gds/0/0100009240/39/linux-UFRII-drv-v620-m17n-20.tar.gz")

sha256sums=("e9025a68006e6c46844692717d51b182107cc886f6a4269067af95a2a8e662b9")

build() {
    tar -xf linux-UFRII-drv-*.tar.gz
    cd linux-UFRII-drv-*/x64/Debian
    mv cnrdrvcups-ufr2-*.deb $srcdir
    cd $srcdir
    rm -rf linux-UFRII-drv*
    ar x cnrdrvcups-ufr2-*.deb
    rm control.tar.xz debian-binary cnrdrvcups-ufr2-*.deb
    tar -xvf data.tar.xz
    rm data.tar.xz
}

package() {
    cd $srcdir
    # Because this package has no sort of make system, there's no `install` command I know of that lets me copy the prepared srcdir to the pkgdir. MarsSeed flagged this package out of date because of my `mv` usage. Hopefully this should be better.
    cp -dr --no-preserve=ownership * $pkgdir
    echo "To open the setup GUI, you can run \`cnsetuputil2\`"
}
