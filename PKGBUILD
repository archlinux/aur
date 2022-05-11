# Maintainer: Serge K <serge.arch@zmail.pro>

# https://github.com/phnx47/pkgbuilds

pkgname=kaizen
pkgdesc="Kaizen ElasticSearch GUI"
pkgver=6.820.106
pkgrel=1
arch=('x86_64')
url='https://www.elastic-kaizen.com/'
license=('custom')
optdepends=('gtk-theme-murrine-collection')
_pkgsrc="${pkgname}-${pkgver}-linux-x64.zip"
source=("${_pkgsrc}::https://elastic-kaizen.com/install/${pkgver}/${_pkgsrc}"
  "kaizen.desktop"
  "LICENSE"
  "kaizen.png")

sha512sums=('98f8b46de539f4c0152decb8f1db4c93d59a73af5d59feece3f06cdda43bc56d2fcbcaa343f75bc5147f228820bdd0c3007f3a376b544d4b9dd1f00e2f94be17'
            'c7555c9173855402c3d47acc0b624e7ef26018b0f31d20db74eb52afea76b6109bec3d66bf3dad99194917dc9a58f784bc45662aa899f633fd2c7adfea4852d1'
            '35e15a34c425c8af17c1141a35cec0cbea6aba65d01443fb39ceb09ff51bb30ab356192d54b33dfb953ef9ddc6e489e42067358543f129e03f9a0c4f5a041529'
            'a0277b72a04cfa7dad2ae8819fc5a009211bbbb44645cc1b7f73fb66e9473d47d5fa6273dfc977bd6746bc435e5ddc21ba28d3cb03e3f090ae6b5ac82137b913')

build() {

  # Correct kaizen.sh
  sed -e "s/jvm/\/opt\/${pkgname}\/jvm/g" -i "$srcdir/${pkgname}.sh"
  sed -e "s/${pkgname}.jar/\/opt\/${pkgname}\/${pkgname}.jar/g" -i "$srcdir/${pkgname}.sh"
}

package() {

  install -Dm644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -dm755 "${pkgdir}/opt"
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/${pkgname}.jar" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/jvm" "${pkgdir}/opt/${pkgname}/"

  # dirty hack
  mkdir -p "$HOME/.config/${pkgname}"

  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
