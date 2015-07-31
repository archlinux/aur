# Maintainer: Rémi BERTHO <remi.bertho@openmailbox.org>
# Contributor: Rémi BERTHO <remi.bertho@openmailbox.org>
pkgname=csuper-gui
pkgver=4.2.0
pkgrel=1
pkgdesc="Universal points counter allowing reflexion exemption"
arch=(any)
url="http://www.dalan.rd-h.fr/wordpress"
license=('GPL')
depends=('gtk3>=3.6' 'libcsuper')
optdepends=('csuper-cli')
makedepends=('cmake')
install="INSTALL"
source=(http://www.dalan.rd-h.fr/binaries/Csuper/4.2.0/Csuper-4.2.0-sources.tar.xz)
sha256sums=('6bcda8cd8c89356af2495ee50a14052cacd6c9d22a9a3f1b4744b360c55b2643')
 
build()
{
    cd "$srcdir/Csuper"
    cmake -G"Unix Makefiles" -DGUI=TRUE || return 1
    make || return 1
    sh compile_translations
}

package()
{
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/csuper/"
    mkdir -p "$pkgdir/usr/share/csuper/Locales/fr_FR/LC_MESSAGES"
    mkdir -p "$pkgdir/usr/share/applications/"
    mkdir -p "$pkgdir/usr/share/man"

	cd "$srcdir/Csuper"
    cp "Installation/csuper-gui" "$pkgdir/usr/bin/"
    cp csuper-gui "$pkgdir/usr/share/csuper/"
    cp csuper-gui.glade "$pkgdir/usr/share/csuper/"
    cp -R "Locales/fr_FR/LC_MESSAGES/csuper-gui.mo" "$pkgdir/usr/share/csuper/Locales/fr_FR/LC_MESSAGES"
    cp "Installation/csuper-gui.desktop" "$pkgdir/usr/share/applications/"
    cp "Man/csuper-gui.1.gz" "$pkgdir/usr/share/man"
}
