# Maintainer: Rémi BERTHO <remi.bertho@openmailbox.org>
# Contributor: Rémi BERTHO <remi.bertho@openmailbox.org>
pkgname=csuper-cli
pkgver=4.2.0
pkgrel=1
pkgdesc="Universal points counter allowing reflexion exemption"
arch=(any)
url="http://www.dalan.rd-h.fr/wordpress"
license=('GPL')
depends=('libcsuper>=4.2.0')
optdepends=('csuper-gui')
makedepends=('cmake')
source=(http://www.dalan.rd-h.fr/binaries/Csuper/4.2.0/Csuper-4.2.0-sources.tar.xz)
sha256sums=('458493a483f953eb7490b385c0557df84c31bf2cdc30f0e670b37c6b02ba1cb1')
 
build()
{
    cd "$srcdir/Csuper"
    cmake -G"Unix Makefiles" -DCLI=TRUE || return 1
    make || return 1
    sh compile_translations
}

package()
{
	cd "$srcdir/Csuper"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/csuper/"
    mkdir -p "$pkgdir/usr/share/csuper/Locales/fr_FR/LC_MESSAGES"
    mkdir -p "$pkgdir/usr/share/man"

    cp "Installation/csuper-cli" "$pkgdir/usr/bin/"
    cp csuper-cli "$pkgdir/usr/share/csuper/"
    cp -R "Locales/fr_FR/LC_MESSAGES/csuper-cli.mo" "$pkgdir/usr/share/csuper/Locales/fr_FR/LC_MESSAGES"
	cp "Man/csuper-cli.1.gz" "$pkgdir/usr/share/man"
}
