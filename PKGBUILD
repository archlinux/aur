# Contributor: Sapphira Armageddos <shadowkyogre.public+aur@gmail.com>
pkgname=magicseteditor-haganbmj-fork
pkgver=2.5.6
pkgrel=2
pkgdesc="A fork of magic set editor, with modern improvements"
arch=('i686' 'x86_64')
url="https://github.com/haganbmj/MagicSetEditor2"
license=('GPL-2.0-or-later')
depends=('hunspell' 'wxwidgets-gtk3' 'wxwidgets-common' 'boost-libs')
makedepends=('boost' 'cmake' 'gendesk')
provides=("magicseteditor")
conflicts=("magicseteditor")
source=("magicseteditor-${pkgver}.tar.gz::https://github.com/haganbmj/MagicSetEditor2/archive/refs/tags/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('d22a5c5d629e6e7e744c6a8f59644ec275a0397c0ccda3e9a488142cacc94b29')

prepare()
{
gendesk -n -f --pkgname="MagicSetEditor2" --pkgdesc="A program to help create Magic: the Gathering cards and sets." --exec="magicseteditor"
cd "MagicSetEditor2-${pkgver}"
}

build()
{
cmake -B build -S "MagicSetEditor2-${pkgver}" -DwxWidgets_CONFIG_EXECUTABLE:FILEPATH="/usr/bin/wx-config" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr'
cmake --build "build"
}

package()
{
	install -Dm755 "MagicSetEditor2.desktop" "${pkgdir}/usr/share/applications/MagicSetEditor.desktop"
    install -Dm755 "./build/magicseteditor" "${pkgdir}/usr/bin/magicseteditor"
	mkdir -p $pkgdir/usr/share/magicseteditor/{resource,data}
	cp -r ./MagicSetEditor2-${pkgver}/data/*.mse-locale "${pkgdir}/usr/share/magicseteditor/data"
	cp -r ./MagicSetEditor2-${pkgver}/resource/* "${pkgdir}/usr/share/magicseteditor/resource"
	install -Dm755 "./MagicSetEditor2-${pkgver}/resource/installer_program.png" "${pkgdir}/usr/share/pixmaps/MagicSetEditor2.png"
}

# vim:set ts=2 sw=2 et:
