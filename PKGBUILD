# Maintainer: Maxim Fomin <maxim@fomin.one>

_pkgname=dracut-colors
pkgname=${_pkgname}-git
pkgdesc="dracut hook to set VT console colors during early userspace"
license=('MIT')
url="https://github.com/mxfm/${_pkgname}"
pkgver=1.df81206
pkgrel=1

source=("$pkgname::git://github.com/mxfm/${_pkgname}")
md5sums=('SKIP')
depends=('dracut' 'setcolors-git')
makedepends=('git')
arch=('any')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm 644 hooks/module-setup.sh "${pkgdir}/usr/lib/dracut/modules.d/10colors/module-setup.sh"
    install -Dm 644 hooks/setcolors.sh "${pkgdir}/usr/lib/dracut/modules.d/10colors/setcolors.sh"

    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
