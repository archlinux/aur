# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname="numnastics"
pkgname="${_pkgname}-git"
pkgver=r13.1b666c1
pkgrel=1
pkgdesc="A number puzzle audio game"
arch=('any')
url="https://gitlab.com/stormdragon2976/numnastics"
license=('GPL3')
depends=('python' 'python-pygame' 'python-pyperclip' 'python-requests' 'python-xdg' 'speech-dispatcher')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.com/stormdragon2976/numnastics.git"
        "$_pkgname.desktop"
        "$_pkgname.sh")
sha512sums=('SKIP'
            'b45168181aeeca72a8d0e74cf6eff6dd2e7511431f8cf9157b9804445145e170c98328a7216ea27d9a02809bba328935e0f4fe95e519648e8217453749c42bbe'
            '5e7686884116fdca9a58508dee891b6285e1ad7755a505c199024036fad3428514d16ccef3e96ff6803a45d67a7ca618000a3c1733c07028a67ad804a8fbc123')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    git submodule update --init --remote --merge
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/opt/numnastics"
  cp -a * "$pkgdir/opt/numnastics"

  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
