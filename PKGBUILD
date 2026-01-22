# Maintainer: Zachary M <minein12@protonmail.com>

pkgname=falcond-profiles
pkgver=r21.f52c344
_pkgver=f52c3445a9b9aa18401b7c8e9bf532c37758e585
pkgrel=1
pkgdesc='Default falcond profiles'
url='https://github.com/PikaOS-Linux/falcond-profiles'
arch=(any)
license=('MIT')
makedepends=('git')

source=(git+${url}.git#commit=${_pkgver})
sha256sums=('c0e8d277df3b8e2306a2564d73a952196bf2bbc6ef9162379b671d2e9b0c8524')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    _pkgdir="$pkgdir/usr/share/falcond"
    cd "$pkgname"

    install -Dm 644 LICENSE \
        -t "$pkgdir/usr/share/licenses/${pkgname}"

    install -vdm 755 "$_pkgdir" "$_pkgdir/profiles" "$_pkgdir/profiles/handheld" "$_pkgdir/profiles/htpc"

    cp -r usr/share/falcond/* "$pkgdir/usr/share/falcond/"
}
