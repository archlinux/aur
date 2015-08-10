# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

pkgname=arch-gdm-theme-list
pkgver=0.1
pkgrel=2
pkgdesc="An Arch Linux Theme for GDM, also with the face browser version"
makedepends=('bash')
depends=('gdm')
arch=(any)
source=()

_gdmthemesdir=usr/share/gdm/themes

package() {
	mkdir -p $startdir/pkg/$_gdmthemesdir/arch/
	cp $startdir/arch.xml $startdir/pkg/$_gdmthemesdir/arch/
	cp $startdir/background.png $startdir/pkg/$_gdmthemesdir/arch/
	cp $startdir/options.png $startdir/pkg/$_gdmthemesdir/arch/
	cp $startdir/help.png $startdir/pkg/$_gdmthemesdir/arch/
	cp $startdir/screenshot.jpg $startdir/pkg/$_gdmthemesdir/arch/
	cp $startdir/GdmGreeterTheme.desktop $startdir/pkg/$_gdmthemesdir/arch/
	cp $startdir/nvidia-arch.png $startdir/pkg/$_gdmthemesdir/arch/

	mkdir -p $startdir/pkg/$_gdmthemesdir/arch-list
	for FILE in $startdir/pkg/$_gdmthemesdir/arch/* ; do 
		BASENAME=${FILE/*\/}
		#ln -s /$_gdmthemesdir/arch/${BASENAME} $startdir/pkg/$_gdmthemesdir/arch-list/${BASENAME}
		cp $startdir/pkg/$_gdmthemesdir/arch/${BASENAME} $startdir/pkg/$_gdmthemesdir/arch-list/${BASENAME}
	done
	rm $startdir/pkg/$_gdmthemesdir/arch-list/arch.xml
	rm $startdir/pkg/$_gdmthemesdir/arch-list/screenshot.jpg
	rm $startdir/pkg/$_gdmthemesdir/arch-list/GdmGreeterTheme.desktop
	patch -o $startdir/pkg/$_gdmthemesdir/arch-list/arch-list.xml $startdir/arch.xml $startdir/list.patch 
	chmod a+r $startdir/pkg/$_gdmthemesdir/arch-list/arch-list.xml 
	cp $startdir/screenshot-list.jpg $startdir/pkg/$_gdmthemesdir/arch-list/
	cp $startdir/GdmGreeterTheme-list.desktop $startdir/pkg/$_gdmthemesdir/arch-list/GdmGreeterTheme.desktop
}
