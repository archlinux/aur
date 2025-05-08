# Maintainer: notfire <luke@notfire.cc>
_maintainer_email="luke@notfire.cc"
pkgname=fadein
pkgver=4.2.0
pkgrel=1
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('gtk2')
source=("$pkgname-$pkgver.tar.gz::http://www.fadeinpro.com/download/demo/fadein-linux-amd64-demo.tar.gz")
sha512sums=('d957d65433f47f2dd4230ef4cd2831168211227b8e22e5312c2a0f2e9f48ac34abbab648474ce8631b9948cb0a496e3aa179f77c4d6d9fc854532351b72d0003')

_vendor_name="fadein-linux-amd64"

_current_version="$(curl -s 'https://www.fadeinpro.com/page.pl?content=version_notes' | sed -n 's/.*The current version is <b>\(.\..\..\)<\/b>.*/\1/p')"

if [[ "$_current_version" != "$pkgver" ]] then
    echo "ERROR: the fadein package is out of date.
The latest version is ${_current_version}.
Please flag the package as out of date at https://aur.archlinux.org/packages/$pkgname
or e-mail me at $_maintainer_email and I will fix this as soon as possible." 1>&2
    exit 1
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
