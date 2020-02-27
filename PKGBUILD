# Maintainer: aksr <aksr at t-com dot me>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=ttf-crimson-pro-git
pkgname=("$pkgbase" "${pkgbase%-git}-variable-git")
_pkgname=CrimsonPro
pkgver=1.002.r0.g04168bb
pkgrel=1
pkgdesc="A professionally produced redesign of Crimson by Jacques Le Bailly"
arch=('any')
url="https://github.com/Fonthausen/$_pkgname"
license=('OFL')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgbase"
    # Upstream release commits are not always tagged, do it manually here so
    # that the number of commits since the stable release is clear.
    git tag | grep -Fq '1.002' || git tag '1.002' 04168bb
    git describe --long --tags --abbrev=7 --match='[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_ttf-crimson-pro-git () {
    pkgdesc+=" (8 fixed weights)"
    provides+=("${pkgname%-git}")
    conflicts+=("${pkgname%-git}")
    cd "$pkgbase"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "fonts/ttfs/$_pkgname"*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" {OFL,AUTHORS,CONTRIBUTORS}.txt
}

package_ttf-crimson-pro-variable-git () {
    pkgdesc+=" (variable weight)"
    provides+=("${pkgname%-git}")
    conflicts+=("${pkgname%-git}")
    cd "$pkgbase"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "fonts/variable/$_pkgname"*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" {OFL,AUTHORS,CONTRIBUTORS}.txt
}
