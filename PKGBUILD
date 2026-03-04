# Maintainer: mzIngDev
pkgbase=ttf-ioskeley-mono-nerd
pkgname=('ttf-ioskeley-mono-nerd' 'ttf-ioskeley-mono-nerd-unhinted')
pkgver=1.0.0
pkgrel=1
arch=('any')
url="https://codeberg.org/mzIngDev/ioskeley-mono-nerd-font"
license=('OFL')
depends=('fontconfig')

source=("hinted.zip::${url}/releases/download/v${pkgver}/ioskeley-mono-nerd-hinted.zip"
        "unhinted.zip::${url}/releases/download/v${pkgver}/ioskeley-mono-nerd-unhinted.zip"
        "LICENSE::${url}/raw/branch/main/LICENSE")

sha256sums=('64a1f9bab7c0be908898d998e7f046699b45e08482cb00a538dcf7f40e09e438'
            'd8081224caa044f1c1af4828eb0d190132c180961d7732d0bb837a030565b8bf'
            'c93f36aa6b37e165f9a80fb493ea22044faa6e97cd500f07dc2e8c8715c59d11')

prepare() {
    mkdir -p "$srcdir/hinted_pkg" "$srcdir/unhinted_pkg"
    
    bsdtar -xf hinted.zip -C "$srcdir/hinted_pkg"
    bsdtar -xf unhinted.zip -C "$srcdir/unhinted_pkg"
}

package_ttf-ioskeley-mono-nerd() {
    pkgdesc="Ioskeley Mono Nerd Font (Hinted) - A patched version for standard screens"
    conflicts=('ttf-ioskeley-mono-nerd-unhinted')
    provides=('ttf-ioskeley-mono-nerd')

    install -Dm644 "$srcdir/hinted_pkg"/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
    
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-ioskeley-mono-nerd-unhinted() {
    pkgdesc="Ioskeley Mono Nerd Font (Unhinted) - A patched version for HiDPI/4K screens"
    conflicts=('ttf-ioskeley-mono-nerd')
    provides=('ttf-ioskeley-mono-nerd')

    install -Dm644 "$srcdir/unhinted_pkg"/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
    
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
