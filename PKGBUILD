# Maintainer: Rasmus Moorats <xx+aur@nns.ee>
# Maintainer: freb

pkgname=burpsuite-pro
pkgver=2025.10.3
pkgrel=1
pkgdesc='An integrated platform for performing security testing of web applications (professional edition)'
url='https://portswigger.net/burp/'
depends=('java-runtime>=24.0.2' 'hicolor-icon-theme')
makedepends=('zip')
arch=('any')
license=('custom')
noextract=("${pkgname}-${pkgver}-orig.jar")
source=("${pkgname}-${pkgver}-orig.jar::https://portswigger.net/burp/releases/download?product=pro&version=${pkgver}&type=Jar"
        "${pkgname}"
        "${pkgname}.desktop"
        'icon16.png'
        'icon24.png'
        'icon32.png'
        'icon48.png'
        'icon128.png'
        'icon256.png'
        'icon512.png'
        'icon.svg')
sha256sums=('e1718816392561f1c127f1c8749ec2d5e4e92c0ab49c2dd548fe8efd1ded749c'
            '939b66c99461307d361c91b811785b92a3cd376a4ac8e72dbf76af1b75503d78'
            'f442258c5616969bfaad7c20b2ff99f05696ad04c2e2c3d145a360615650b9ec'
            'ff0b230af06fb76af053090ac021bf45b88341d746e67f6bb9e94ba40957d9d8'
            'a6791fcaee558f6744b4f5a3fc0af2c9ad7ce244033e224c4e4464563ac9b911'
            '48d529f2a045b1179d9cd87ffdeb7fd469d963f7606fd22b7edc665d0515e1d2'
            '2b2407b8ab2ee181bfd64e3ba3e3090a328cbef8f53cce20ba76cffbfb3bc1d1'
            '28d17763c17e010936ad8ed44427d9ce6523510f580aefce52eb7c0f26b48045'
            'da6469f32b0acfcad2057cf0920c128bbbf64bc72ec6a4d5e5ba10d5b8a2d859'
            '6bbfd022aa451efeb439a89527b814ae06f7ce6196f7ad8db276e9ad372a7e32'
            '8777077ed5b1809c8adde4c056a315f8ec8f1b79f4c4c0e60eb3582c4d7ab71d')

prepare() {
  cp "${srcdir}/${pkgname}-${pkgver}-orig.jar" "${srcdir}/${pkgname}-${pkgver}.jar"
  # remove useless chromium versions
  zip -d "${srcdir}/${pkgname}-${pkgver}.jar" 'chromium-macosx*.zip' 'chromium-win*.zip'
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # install icons
  for size in 16 24 32 48 128 256 512; do
    install -Dm644 "${srcdir}/icon${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/burpsuite-pro.png"
  done
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/burpsuite-pro.svg"
}
