# Maintainer: MicLeh <micleh at proton dot me>
pkgname=cornelsen-offline-lernen-bin
pkgver=37.10.2
pkgrel=2
pkgdesc="Cornelsen Offline Lernen Electron App"
arch=('x86_64')
url="https://www.cornelsen.de"
license=('custom')
depends=('electron')
source=("${pkgname}-${pkgver}.zip::https://ebook.cornelsen.de/uma20/public/v2/uma/offline/win"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "icon16.png"
        "icon32.png"
        "icon96.png")
b2sums=('2801cc40ad4c023451bd2a2713e6d69ae036d32c450bc2ef5a920dd3c8b8bc3bddb7c5a22cb9b16fad3dad9b217ff3026be73a17410082c87d9ebdd90418cfad'
        '27530dc986315e693c6ed1d6c329cac870f8f1ecccba2bd29bb9c8da5ee55f9db15143c8d580dae8869c964530da4c75bb6ba0f73ed0a8838e32b5a7108cbfcd'
        '8157b061d35da630252a8c402a98fb978fcad59fcfa813eb8b67dfeaae7e467051d659201e55b5d1811ae15eca49e47189a5a9840277f09876cf1d7021cfc1da'
        '8dd68d9cd90347b954da9280d2133bc45706eec1e74261bdf19f53b61150ee5168db20a0f217643230c4dc66fb840f9ef61fce5f6aff5853b1bebae4bc9f4c65'
        'b326c7f468c3cecb0e2618bae56092b7c6c5fa7e8f43f499645df01c2b468e74052bef51d48b36a8a7ade2fa12f9612591eaf38819998868271ec23abd366ad5'
        '302bef8514b991cb6903d2def32abf348329a1cf104009b3c50c0e83e44b15103b89f669fb2012894df0c7d6ab926151f09e0cf61aff4102296be7071f66f794')

prepare() {
    :
}

package() {
    _asar_path=$(find . -name "app.asar" | head -n 1)
    
    if [ -z "$_asar_path" ]; then
        echo "ERROR: app.asar not found"
        exit 1
    fi

    install -Dm644 "$_asar_path" "$pkgdir/usr/share/$pkgname/app.asar"
    install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    
    # Icons
    install -Dm644 "icon16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
    install -Dm644 "icon32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
    install -Dm644 "icon96.png" "$pkgdir/usr/share/icons/hicolor/96x96/apps/${pkgname}.png"
    
    # Licenses
    _license=$(find . -name "LICENSE" | head -n 1)
    if [ -n "$_license" ]; then
        install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
