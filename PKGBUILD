# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_wayback='https://web.archive.org/web/20160303165857'
_origroot='https://www.oodletuz.fsnet.co.uk/soft'
_fullurl="${_wayback}/${_origroot}"

_name=tcmaker
pkgname="fml-${_name}"
pkgver=5.11
pkgrel=2
pkgdesc='FML Test Card Maker: An application that allows to create test cards and more basic patterns from their individual elements (colour bars, frequency gratings, etc), rather than having to draw them manually with a graphics package.'
url="${_fullurl}/${_name}.htm"
arch=('i686' 'x86_64')
license=('LicenseRef-custom')
depends=('sh' 'wine' 'wine-gecko' 'hicolor-icon-theme')
install="${_name}.install"

source=(
  "${_name}.zip::${_fullurl}/${_name}.zip"
  "${_name}.sh"
  "${_name}-fonts-install.sh"
  "${_name}-fonts-uninstall.sh"
  "${_name}.desktop"
  "${_name}-icons.tar.gz"
)
sha256sums=('a3afca540f26a530f8a65c808e52a9531f425a04df5672297837a6c75a88d2c0'
            '3ffc972340cdeef0128803fe3e5422057b40468a952710c95b4c06e830850a04'
            '1a6167e800369a2c619cc53b8d0ee8cc710d468b3a8e9cc6430242141b82433e'
            '7066e3e6e3ae6858d9307a830c79d56d9af4c7f7f210eadceafb17d62beff8c0'
            'b920bd04aa14134f4becf046975518e8810ec32be0f81b620f04317a7fccda40'
            'ac36dfc5a416284b376cd43183527193ab433264f0d2a80765c1d85f7786bfc6')

package() {
  cd "$srcdir"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  for f in *.tcd *.ico *.exe *.chm *.fon readme.txt; do
    install -Dm644 "$f" "${pkgdir}/usr/share/${pkgname}/$f"
  done

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '18,46p' readme.txt > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chmod 644 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}/README"

  for s in *.sh; do
    install -Dm755 "$s" "${pkgdir}/usr/bin/${s%.*}"
  done

  install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"

  for size in 16 22 32 48 64 128 256 512; do
    local icon_folder="icons/hicolor/${size}x${size}"
    install -Dm644 "${_name}_$size.png" "${pkgdir}/usr/share/${icon_folder}/apps/${_name}.png"
  done
}

