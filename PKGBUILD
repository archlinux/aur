# Maintainer: notfire <luke@notfire.cc>
_maintainer_email="luke@notfire.cc"
pkgname=fadein
pkgver=5.0.6
pkgrel=1
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1' 'libtiff5')
source=("$pkgname-$pkgver.tar.gz::https://www.fadeinpro.com/download/demo/fadein-linux-x64-demo.tar.gz")
sha512sums=('c74803cbe7b4de787210b93a3542b98b2d342964931e9b28fdc862ecdfd328318dfc785cac367ded787cf7f3f5bf1ea11f7f004d3819ae432d660ea82b978a65')

_vendor_name="fadein-linux-x86_64"

_current_version="$(curl -s 'https://www.fadeinpro.com/page.pl?content=version_notes' | sed -n 's/.*The current version is <b>\(.\..\..\)<\/b>.*/\1/p')"

if [[ "$_current_version" != "$pkgver" ]] then
    echo "ERROR: the fadein package is out of date and may not build properly.
The latest version is ${_current_version}.
Please flag the package as out of date at https://aur.archlinux.org/packages/$pkgname
or e-mail me at $_maintainer_email and I will fix this as soon as possible." 1>&2
fi

package() {
    cd "$_vendor_name-$pkgver"

    install -d ${pkgdir}/usr/share/
    cp -R usr/share/fadein ${pkgdir}/usr/share/

    install -Dm644 usr/share/applications/fadein.desktop ${pkgdir}/usr/share/applications/fadein.desktop

    install -d ${pkgdir}/usr/bin/
    ln -s /usr/share/fadein/fadein ${pkgdir}/usr/bin/fadein
}
# modeline:
# vim: ts=4 sts=4 sw=4 et
