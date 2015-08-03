# Maintainer: Rémi BERTHO <remi.bertho@gmail.com>
# Contributor: Rémi BERTHO <remi.bertho@gmail.com>
pkgname=pdf-presentation
pkgver=1.0.0
pkgrel=2
pkgdesc="A GUI of pdfpc"
arch=(any)
url="http://www.dalan.rd-h.fr/wordpress"
license=('GPL')
depends=('gettext')
depends+=('gtk3>=3.10')
depends+=('pdfpc')
makedepends=('cmake')
conflicts=('pdf-presentation-pdfpc')
install="INSTALL"
source=(https://github.com/Dalan94/pdf-presentation/releases/download/1.0.0/pdf-presentation.tar.gz)
md5sums=('8e14a9414c9bb20d782b052fd019860f')
 
build()
{
    cd "$srcdir/pdf-presentation"
    cmake -G"Unix Makefiles" || return 1
    make || return 1
    sh compile_translations
}

package()
{
	cd "$srcdir/pdf-presentation"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/pdf-presentation/"
    mkdir -p "$pkgdir/usr/share/pdf-presentation/Locales/fr_FR/LC_MESSAGES"
    mkdir -p "$pkgdir/usr/share/applications/"
    
    cp "Installation/pdf-presentation" "$pkgdir/usr/bin/"
    cp pdf-presentation "$pkgdir/usr/share/pdf-presentation/"
    cp pdf-presentation.glade "$pkgdir/usr/share/pdf-presentation/"
    cp -R "Locales/fr_FR/LC_MESSAGES/pdf-presentation.mo" "$pkgdir/usr/share/pdf-presentation/Locales/fr_FR/LC_MESSAGES"
    cp "Installation/pdf-presentation.desktop" "$pkgdir/usr/share/applications/"
}
