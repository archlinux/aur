# Maintainer: SuperBart <superbart_chen@qq.com>

pkgname=touhoudoom
pkgver=1
pkgrel=23
pkgdesc="A DOOM II Mod combines Doom and Touhou"
arch=('any')
url="https://github.com/UntitledsTakenNOOOO/TouhouDoom"
license=('custom')
install=${pkgname}.install
depends=('gzdoom' 'freedoom')
makedepends=('zip' 'git')
optdepends=('doom2-data-steam: for better preformance'
            'final-doom-data-steam: for better preformance')
source=("${pkgname}::git+${url}"
        ${pkgname}.desktop
        ${pkgname}.install
        touhou-doom
        gzdoom-touhou.ini)
md5sums=('SKIP'
        'fd88abfc7918bbd52b4f4e1aaa59eba0'
        '9ac83684418f2f2bb817c3305a1959af'
        'ca9e1a30d8e38d14297423396a119ce9'
        'c50cbdbd6fba0a6abb5cc9d5550e93e2')

prepare() {
  cd "${srcdir}/${pkgname}/pk3"
  git submodule update --init --recursive
  zip -r ${pkgname}.pk3 * .[^.]*
  mv ${pkgname}.pk3 ../../${pkgname}.pk3
}

package() {
  install -Dm644 "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.pk3" \
    "${pkgdir}/usr/share/games/doom/${pkgname}.pk3"
  install -m644 "gzdoom-touhou.ini" \
    "${pkgdir}/usr/share/games/doom/gzdoom-touhou.ini"
  install -Dm755 "touhou-doom" "$pkgdir/usr/bin/touhoudoom"
}


