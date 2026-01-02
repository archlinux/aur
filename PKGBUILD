# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Mateus Honorato

pkgname=uefitool-bin
pkgver=A72
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor'
arch=(x86_64)
url='https://github.com/LongSoft/UEFITool'
license=(BSD-2-Clause)
provides=(
  "uefiextract=${pkgver}"
  "uefifind=${pkgver}"
  "uefitool=${pkgver}"
)
source=(
  "UEFIExtract-${pkgver}-${pkgrel}.zip::${url}/releases/download/${pkgver}/UEFIExtract_NE_${pkgver}_x64_linux.zip"
  "UEFIFind-${pkgver}-${pkgrel}.zip::${url}/releases/download/${pkgver}/UEFIFind_NE_${pkgver}_x64_linux.zip"
  "UEFITool-${pkgver}-${pkgrel}.zip::${url}/releases/download/${pkgver}/UEFITool_NE_${pkgver}_x64_linux.zip"
  "uefitool_${pkgver}-${pkgrel}_16.png::${url}/raw/${pkgver}/UEFITool/icons/uefitool_16x16.png"
  "uefitool_${pkgver}-${pkgrel}_32.png::${url}/raw/${pkgver}/UEFITool/icons/uefitool_32x32.png"
  "uefitool_${pkgver}-${pkgrel}_48.png::${url}/raw/${pkgver}/UEFITool/icons/uefitool_48x48.png"
  "uefitool_${pkgver}-${pkgrel}_64.png::${url}/raw/${pkgver}/UEFITool/icons/uefitool_64x64.png"
  "uefitool_${pkgver}-${pkgrel}_128.png::${url}/raw/${pkgver}/UEFITool/icons/uefitool_128x128.png"
  "uefitool_${pkgver}-${pkgrel}_256.png::${url}/raw/${pkgver}/UEFITool/icons/uefitool_256x256.png"
  "uefitool_${pkgver}-${pkgrel}_512.png::${url}/raw/${pkgver}/UEFITool/icons/uefitool_512x512.png"
  "uefitool_${pkgver}-${pkgrel}.desktop::${url}/raw/${pkgver}/UEFITool/uefitool.desktop"
  "uefitool_${pkgver}-${pkgrel}.license::${url}/raw/${pkgver}/LICENSE.md"
)
sha256sums=('cfa9a8ad7b17321007b81254e34cd93755e8ca194b7329b452a35542ae483a7e'
            '9e0bcb313e535525c7c60b76653c6f95fde5a2176bea24d4a84d53c749894c92'
            '402612653bdcc8e6a68e31ae8375db497ae228f4f888068681abc731df81938d'
            '8a026dc03d82500aeac6bfa47ddb838b10196b7cc09169981430e67bf79aab7a'
            '9b6bce56fcccea4104642c6c8d393e6043671a8fd45b1c7bf8495407b4ad206a'
            'ed001d549f96e142fd609e9a89d3482702d9d37abfa3f6a39cfa0fd2a9b36335'
            '6b82394411bdc2a2b62f18056f07f6f29a651c6f542cfd132db0ba255e05242e'
            '20e1cf7fe9e7b429a2daa0b75e17f4d0f362d1312401c6178658fd9fdb69dc14'
            'c75715b87263f3663bdc60bd0ee1dcbb374a688931018f04d767ea3cfc965bf7'
            '33ace8f0eb8f7c4f6918e9a3033d676293b4decd0fa5ca28987818a63e0ecf1b'
            'bb0d0c10ff1a860ded6c2f2c09d3aa3fe8f7ef77ecd88b42a4cf893f8d8cfc5b'
            'fa9dc837378838e632d09ca56f1b8e8b002245b9b4471a4335024d74616c4c1f')

package() {
  depends=(
    hicolor-icon-theme
    qt6-base
  )

  for _tool in uefiextract uefifind uefitool; do
	install -Dm755 "${srcdir}/${_tool}" -t "${pkgdir}/usr/bin"
  done

  install -Dm644 "uefitool_${pkgver}-${pkgrel}.desktop" "${pkgdir}/usr/share/applications/uefitool.desktop"

  for _dim in 16 32 48 64 128 256 512; do
	local _size="${_dim}x${_dim}"
	local _icon="uefitool_${pkgver}-${pkgrel}_${_dim}.png"
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/uefitool.png"
  done

  install -Dm644 "uefitool_${pkgver}-${pkgrel}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
