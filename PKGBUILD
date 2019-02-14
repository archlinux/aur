# Maintainer: Liz Gerhard <liz@lizufyr.eu>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=fromscratch-bin
_binname=FromScratch
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple but smart note-taking app"
arch=('x86_64')
url="https://fromscratch.rocks"
license=('MIT')
provides=('fromscratch')
conflicts=('fromscratch')
source=("https://raw.githubusercontent.com/Kilian/${_binname}/v${pkgver}/LICENSE"
        "https://raw.githubusercontent.com/Kilian/${_binname}/v${pkgver}/app/assets/img/icon.png"
        "${_binname,,}.desktop")
source_x86_64=("https://github.com/Kilian/${_binname}/releases/download/v${pkgver}/${_binname}_${pkgver}_amd64.deb")
sha256sums=('8393225b48095d8ba6e01e1e78f37494843c6db929dacf87457b4ca1616deab8'
            '6588f5c6eca8ba660ac66977a904c0c6e2bfcdde94593c267d918fee0043d796'
            'cc984639b604c8f442b28b5bfb8481a61634fcc48e06c460036694ee47c0ed54')
sha256sums_x86_64=('62a8a98865051d3e5da4176da323e62c40077574623c800e31f4fd8134b38e03')

package() {
  cd "${srcdir}"
  tar xf data.tar.xz

  install -d "${pkgdir}/opt/${_binname,,}"
  cp -ra opt/${_binname}/* "${pkgdir}/opt/${_binname,,}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share"
  cp -ra usr/share/icons "${pkgdir}/usr/share/icons"
  ln -s "/opt/${_binname,,}/${_binname,,}" "${pkgdir}/usr/bin/${_binname,,}"

  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${_binname,,}"
  install -Dm644 ../icon.png "${pkgdir}/usr/share/pixmaps/${_binname,,}.png"
  install -Dm644 "../${_binname,,}.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
