# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DoomRunner"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.9.0
pkgrel=1
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/${_Name}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}.ico::${url}/raw/refs/tags/v${pkgver}/Resources/${_Name}.ico"
        "${_pkgsrc}.desktop::${url}/raw/refs/tags/v${pkgver}/Install/XDG/${_Name}.desktop"
        "io.github.Youda008.${_pkgsrc}.appdata.xml::${url}/raw/refs/tags/v${pkgver}/Install/XDG/io.github.Youda008.${_Name}.appdata.xml")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc}-Linux-64bit-dynamic.zip")
b2sums=('bf64b656497903ec5de2e6af29fd3168def7c488e4a1e23d501d75b98544fd9b627789e29ecd7a385a7dd92ec43e6bda171cbf120ee0007d4050bf3def8a8a89'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
        'a200ad98fe90dd2644d689373e7fbeba4d1e14e103504283f95d2b687e2255ac36ae9636ec359b088980ea832f07ca75df3fd12a9eebdfab3316322e4e905865'
        'e636fca0bc4861cfbb7e3ec6e9ef4678c07b38a45558e0b6e69bb0686e5e28cbae1fb8231e094f53b8a55babfd2302028c7173630ca7dc72d8c315ae480a8eed'
        'cd6256eb3446ba9916dfe87a7dd602dacb18285c1aab5e9108d4e305ad96c5666fe2f8a0e23cfc0f9c26f3bb10be8bdbb6bca970a5575c20881dac009d6b74d4'
        '17b7c56032d52e9a901e10cf4b4c4b3ced11bcce115ae2d784fbf885573a836a027e392e42edf66f340ffb34d73e3160eef4141bb3cc24017cb8ed5ebf791192'
        '5664143059fea0f19545c17f4cf0be325c343dc9e7823b6380642207dab1dddd325b3e7c64f3b1a75d3ebb2ed4cc7c518b37c73bde8cbfcc02f6faf50e7886ba'
        '62701d1fcf0f84adc1e980a04a70e6670a091d276cca1b8d2245e96add73f517e9fe9ca5d4456cd8cbdf7c54b0cb5ac22684ac8764912ded3c6328824e9ad0a2'
        '2d67d24954e99062097d26c29218f4435a0bf3b8d63a09c4807063d99e0caf9cdab623b567c5e97ce261dff77977bb86e6de5c4b67724ce1b7b629c52b7435a4'
        '4481df19b67be9693258189c3aa5acfd2fe9b9e539c50d1b759c0e35b4d1b46f24703c7cc319f1c928634668a68ba874af9b9bec435d7b4ee29ed2e2d41cc973'
        '76cced4d29d76368ddd5ae769f6fcf88ef2068645246961d0305ca31d6aca025dd5a95a55ea4f9038b4e13525d925c46c020a3bf88d715a509a3268302d3a3e2')
b2sums_x86_64=('71f60356713c06463027931faaeb1939152ad43323461d4d66a51f6526c00e6817f8d7c3b69df47e96faff652037ac24a8264436a8890b0b69e905661bc90ec0')

declare -rg _icons="16 24 32 48 64 128"
for size in $_icons; do
  source+=("${_pkgsrc}.${size}x${size}.png::${url}/raw/refs/tags/v${pkgver}/Install/XDG/${_Name}.${size}x${size}.png")
done

package() {
  cd "${srcdir}"
  install -vDm755 "${_Name}" "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.ico" "${pkgdir}/usr/share/pixmaps/${_Name}.ico"
  install -vDm644 "${_pkgsrc}.desktop" "${pkgdir}/usr/share/applications/${_Name}.desktop"
  install -vDm644 "io.github.Youda008.${_pkgsrc}.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.Youda008.${_Name}.appdata.xml"

  for size in $_icons; do
    install -vDm644 "${_pkgsrc}.${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_Name}.png"
  done
}
