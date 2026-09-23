# Maintainer: notfire <luke@notfire.cc>
_maintainer_email="luke@notfire.cc"
pkgname=fadein
pkgver=5.0.14
pkgrel=1
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1' 'libtiff5')
source=("$pkgname-$pkgver.tar.gz::https://www.fadeinpro.com/download/demo/fadein-linux-x64-demo.tar.gz")
sha512sums=('b25e2e47443dbb69e9d6ad5e870db59034a00963d38372bf92e1f68b8d9e4609baab9655f8d4ffc87a528b5d0bdb8abdce6508fe9a3b2dc5336702febbb0ca6b')

_vendor_name="fadein-linux-x86_64"

_current_version="$(curl -s 'https://www.fadeinpro.com/page.pl?content=version_notes' | sed -n 's/.*The current version is <b>\([0-9]*\.[0-9]*\.[0-9]*\)<\/b>.*/\1/p')"

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
