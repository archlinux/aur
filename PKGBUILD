# Maintainer: Rémi BERTHO <remi.bertho@dalan.fr>
# Contributor: Rémi BERTHO <remi.bertho@dalan.fr>
pkgname=pdf-presentation
pkgver=1.0.0
pkgrel=3
pkgdesc="A GUI of pdfpc"
arch=(any)
url="https://www.dalan.fr"
license=('GPL')
depends=('gettext')
depends+=('gtk3>=3.10')
depends+=('pdfpc')
makedepends=('cmake')
conflicts=('pdf-presentation-pdfpc')
install="INSTALL"
source=(https://www.binaries.dalan.fr/pdf-presentation/pdf-presentation.tar.gz)
sha256sums=('875a59f33b82cd85e6684a9f3ff4807e92c787417d25683fafdb31a2136ae830')
 
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
