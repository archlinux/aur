# Maintainer: Rémi BERTHO <remi.bertho@openmailbox.org>
# Contributor: Rémi BERTHO <remi.bertho@openmailbox.org>
pkgname=libcsuper
pkgver=4.2.0
pkgrel=2
pkgdesc="Universal points counter allowing reflexion exemption"
arch=(any)
url="http://www.dalan.rd-h.fr/wordpress"
license=('GPL')
depends=('libharu' 'libxml2')
optdepends=('csuper-cli' 'csuper-gui')
makedepends=('cmake')
install="INSTALL"
source=(http://www.dalan.rd-h.fr/binaries/Csuper/4.2.0/Csuper-4.2.0-sources.tar.xz)
sha256sums=('6bcda8cd8c89356af2495ee50a14052cacd6c9d22a9a3f1b4744b360c55b2643')
 
build()
{
    cd "$srcdir/Csuper"
    cmake -G"Unix Makefiles" || return 1
    make || return 1
    sh compile_translations
}

package()
{
    mkdir -p "$pkgdir/usr/lib/"
    mkdir -p "$pkgdir/usr/share/csuper/Locales/fr_FR/LC_MESSAGES"
    mkdir -p "$pkgdir/usr/share/mime/packages"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/mimetypes"

	cd "$srcdir/Csuper"
    cp libcsuper.so "$pkgdir/usr/lib/"
    cp -R "Locales/fr_FR/LC_MESSAGES/libcsuper.mo" "$pkgdir/usr/share/csuper/Locales/fr_FR/LC_MESSAGES"
    cp -R Fonts "$pkgdir/usr/share/csuper/"
    cp -R Images "$pkgdir/usr/share/csuper/"
    cp "Installation/Mime/csuper.xml" "$pkgdir/usr/share/mime/packages/"
    cp "Installation/Mime/application-csu.png" "$pkgdir/usr/share/icons/hicolor/48x48/mimetypes"
}
