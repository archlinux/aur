# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname="monkeyspank"
pkgname="${_pkgname}-git"
pkgver=r15.5469af2
pkgrel=1
pkgdesc="A reaction based audio game"
arch=('any')
url="https://gitlab.com/stormdragon2976/${_pkgname}"
license=('GPL3')
depends=('python' 'python-pygame' 'python-pyperclip' 'python-requests' 'python-setproctitle' 'python-xdg' 'speech-dispatcher')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.com/stormdragon2976/${_pkgname}.git"
        "$_pkgname.desktop"
        "$_pkgname.sh")
sha512sums=('SKIP'
            'e7e577621eab2ce2db567f0132cc0b981f4136f460c90c57c18abdd0ba8c092d65d58ce7d13d824b003540fe98cfb110462418b6619fedd1b1ec64d98e06ce92'
            'e19c347d7fbf93d2d069f938d3cc1112c35e543d97a292a295cf1b8e114ae56c92977ead7a2bd673630f7b343d256f1ba7cf3a2c3b059d6d1e481bbedcc882ca')

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
  install -d "$pkgdir/opt/${_pkgname}"
  cp -a * "$pkgdir/opt/${_pkgname}"

  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
