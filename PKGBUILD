# Maintainer: zebra2711 <zebra2711t@gmail.com>

pkgname=srwm-bin
_pkgver=$(curl -s "https://api.github.com/repos/infraflakes/srwm/releases/latest" | jq -r '.tag_name' | sed 's/^v//')
pkgver=0.2.0
pkgrel=1
pkgdesc='A fully statically linked dynamic X11 window manager written in Go, C and Lua'
arch=('x86_64')
license=('MIT')
url='https://github.com/infraflakes/srwm'
conflicts=("srwm")
options=('!strip')
depends=()
optdepends=('iw: to show wifi info'
            'xorg-xset'
            'bc')
source=("$url/releases/download/v${_pkgver}/srwm-v${_pkgver}-linux-amd64"{,.sha256}
        "srwm.desktop"
        "https://raw.githubusercontent.com/infraflakes/srwm/refs/heads/main/LICENSE")
sha256sums=('SKIP'
            'SKIP'
            'f3bf35d06e585093fd5413dc8e7e33754e301ee15ac4a31fc27c8af14d5c4e4a'
            '8bbe268a549563fb2895eefd3c43869ca436eda0ba826474334270ad84a7c98d')

pkgver() {
   echo $_pkgver
}

prepare(){
   sha256sum -c "srwm-v${_pkgver}-linux-amd64.sha256" || exit 1
}

package() {
   install -Dvm755 "srwm-v${_pkgver}-linux-amd64" "$pkgdir/usr/bin/srwm"
   install -Dvm755 "srwm.desktop" "$pkgdir/usr/share/xsessions/srwm.desktop"
   install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}/"
}

# vim:set ts=4 sts=4 sw=4 et:
