# Maintainer: NebulaBC <ufrii.print@nebulabc.net>
pkgname='ufrii-print'
pkgver=2
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

source=("https://gdlp01.c-wss.com/gds/6/0100009236/20/linux-UFRII-drv-v600-us-02.tar.gz")

sha256sums=("964b5eb0a706b0739432099eab4e0a61c93aa9a8bfb52fd9376a6d07c17f9f8b")

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
