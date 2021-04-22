# Maintainer: Serge K <arch@phnx47.net>

# Repository for PR: https://gitlab.com/phnx47-aur/kaizen

pkgname=kaizen
pkgdesc="Kaizen ElasticSearch GUI"
pkgver=5.79.96
pkgrel=1
arch=('x86_64')
url='https://www.elastic-kaizen.com/'
license=('custom')
source=("https://www.elastic-kaizen.com/releases/kaizen-${pkgver}-linux-x64.zip"
  "kaizen.desktop"
  "LICENSE"
  "kaizen.png")

sha512sums=('9123ac7bf1fe2bef3ebeaa8d45ba2f8faee27689874e36f7ee20c9bc312082b611ae20fd542d51e132cc31ff511ca5559fcb77e1cce421af501d1c02570fc4a3'
            '889095694d1d5b3268242acdb5be3c9d62d608a9263e46baf311e88cffbbe21562321906eac5e2b3e12d6a094e7c122a565386a306b428db415009373d9fd80c'
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
  cp -a "${srcdir}/." "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  
  # dirty hack
  touch "${pkgdir}/usr/share/${pkgname}/licence"
  touch "${pkgdir}/usr/share/${pkgname}/settings"

  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
