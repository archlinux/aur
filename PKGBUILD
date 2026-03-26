# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DoomRunner"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.9.2
pkgrel=1
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=(
  'x86_64'
)
url="https://github.com/Youda008/${_Name}"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libstdc++'
  'minizip'
  'qt6-base'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}.ico::${url}/raw/refs/tags/v${pkgver}/Resources/${_Name}.ico"
  "${_pkgsrc}.desktop::${url}/raw/refs/tags/v${pkgver}/Install/XDG/${_Name}.desktop"
  "${_pkgsrc}-io.github.Youda008.${_Name}.appdata.xml::${url}/raw/refs/tags/v${pkgver}/Install/XDG/io.github.Youda008.${_Name}.appdata.xml"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_Name}-${pkgver}-Linux-x86_64-dynamic_exe.zip"
)
sha256sums=('0991be6a602d3df536ba3ff5cb82607865f8340362b4455dfae4767325751942'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'c00ab4d803c30444ab7ba7f4d9c4ba1e0697892cfe5ee0c3fe5a9d5b7ff5ab5c'
            'ad35ee53aca5aede2703c03e2f11361fa7764d5638d0f48026b12126fc7909ae'
            'be8bc957ad4ac8923500f55afc1f88f9fcbd57a7ad7534de634538a1f60cf3d8'
            '52ccb81287efb02e48a5acf4248cd80a803bd76c8ee6892e7f070b60b2ce5b50'
            '0de29805e3ecd6337b40287d58f55b821082a146a00e0df8b1ea2f13876c08c5'
            '5106b032220f756cea58a3b0d029cdc2496cc768c837419f31e0b9c5e5b84290'
            'bdbb114022d39dbe8f0a945b3965b2fca65998548e30a40884952613b9add49b'
            'b10f0c70f61fb8819eaae76b6162c0e9c855f5c63a60808a192d3f6bde9b3127'
            'cf561764e7268e960dd721bf53da0753c2ae699bb3ee1f8d3c9cf2ec1406160c')
sha256sums_x86_64=('e4dc000106b9e44c76b39f99a333650035eb35aa1a01c38c0bf369034278836c')

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
  install -vDm644 "${_pkgsrc}-io.github.Youda008.${_Name}.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.Youda008.${_Name}.appdata.xml"

  for size in $_icons; do
    install -vDm644 "${_pkgsrc}.${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_Name}.png"
  done
}
