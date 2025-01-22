# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DoomRunner"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.8.3
pkgrel=1
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/${_Name}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt5-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_Name}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}.ico::${url}/raw/refs/tags/v${pkgver}/Resources/${_Name}.ico"
        "${_pkgsrc}.desktop::${url}/raw/refs/tags/v${pkgver}/Install/XDG/${_Name}.desktop"
        "io.github.Youda008.${_pkgsrc}.appdata.xml::${url}/raw/refs/tags/v${pkgver}/Install/XDG/io.github.Youda008.${_Name}.appdata.xml")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc}-Linux-64bit-dynamic.zip")
b2sums=('38cb3e848a006c801c4a1c9827a6718f3033d57e948214a7e0425ae3902713eb1a1808f4dd38b4dc844757245f748d6f083b9629bc180d59dd8a128335772954'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
        'acd1dc478995306c9ade047df0e88db0e6dbafaa1653e061c6dec730d404aed195790d8469161123f3ebc0ae5fa174229973416bf37fb646a2fd5569efd06c65'
        '2a34964139ca7c65d94c30eea65d82cd853d3dbc164ba4d4801e3ff2af4598e8041b5067ab186e0f3e9ee0328352db201173af213f8a7ef906648ce17d57185b'
        'e1fa18bff2d16cdbf64eaa45a21de209c8ac1e164f7d5d28be484262fb1871852ccb32e65a7324f91e10987aafeec85cebf370bbe97a187d86cab4e75639e778'
        '0920f77f42377f22639135cfe7ae45adc525388afdd193f0cf24017787827155bb260195595520951bf7620aa5fa4548c4ebb96aa8449380cd8e7d74dbf7effb'
        '4105b9e03d8bfcfd8e30e9c7c7b7df1f2a992d05803a55e096177a96a983b4e0f8f04ec666631b942f923e0f8193057d7a24f0c6ff83a685b2f107ed22cd36b2'
        'aaa7d47f77095bc498b3f4e0e9fd60a915a5d5539a78f4532c955dbdfdf13ba3339c313f122180864ae3fec9ac53bef5b82646852125855043dbadbe5d0e3cf3'
        'c9bc69b935efc66d53043107cfe99cb285bcba3a3d99fe4eb93533a6811dbb2d7dad5acfa72a6ac6ac105b49437f30398f66b8d3d31166b3dbc9ae0c45ac3737'
        'd57d4c42d017de0c43afe46271a7c25272c4d6ea0b668564eea893bbd94457c79f6321a2f6ed45f3dda1e10f26a257eef95cb0286446ae43d2b4f923128dacbf'
        '68c13c83bbea4533b61f56286462043287be26f0f224baa5a81beeea22c165d929c68ef66badcaa0d763729ceff05169444a1bbaac73409a1c7e10e3f9d8f412')
b2sums_x86_64=('786903d96df76edb3f10d9d679a2168524f2546c50247c2035502914de1be8aebe7a7720e36b740cdf100605fb8a34b429e81c0dc1ca1895d8a1e3375c09556d')

declare -rg _icons="16 24 32 48 64 128"
for size in $_icons
do
  source+=("${_pkgsrc}.${size}x${size}.png::${url}/raw/refs/tags/v${pkgver}/Install/XDG/${_Name}.${size}x${size}.png")
done

package() {
  cd "${srcdir}"
  install -vDm755 "${_Name}" "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.ico" "${pkgdir}/usr/share/pixmaps/${_Name}.ico"
  install -vDm644 "${_pkgsrc}.desktop" "${pkgdir}/usr/share/applications/${_Name}.desktop"
  install -vDm644 "io.github.Youda008.${_pkgsrc}.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.Youda008.${_Name}.appdata.xml"

  for size in $_icons
  do
    install -vDm644 "${_pkgsrc}.${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_Name}.png"
  done
}
