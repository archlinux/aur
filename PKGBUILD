# Maintainer: d10n <david@bitinvert.com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-2026-bin
pkgver=1502
pkgrel=2
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations"
url="https://www.softmaker.com"
arch=('x86_64')
license=('LicenseRef-custom')
depends=('bash' 'fontconfig' 'glib2' 'glibc' 'gst-plugins-base-libs' 'gstreamer' 'gtk3'
         'hicolor-icon-theme' 'libcups' 'libgcc' 'libgl' 'libstdc++' 'libx11' 'libxext'
         'libxmu' 'libxrandr' 'libxrender' 'zlib')
options=('!debug')
source=('planmaker-2026.desktop'
        'presentations-2026.desktop'
        'textmaker-2026.desktop'
        'planmaker26'
        'presentations26'
        'textmaker26'
        'softmaker-office-2026.xml'
        "http://www.softmaker.net/down/softmaker-office-2026-${pkgver//./-}-amd64.tgz")
md5sums=('dcec18ac4a8740a39aba28f9e4cdad7d'
         'd19ac0e7338d9621374e9a6c132c4f8b'
         '2076d37cfa0f426e39ea20043f0bbd2c'
         'd68f57b9a93d719e45adcc0bb5fcea2d'
         '1a812254c2f77ffb8b1c1488ad121927'
         '332008e1d489aabc91570e2b9a5fc9df'
         '2b27b268ad1c060bc2f2afced1b2f067'
         'b1e1ad824c5d92b58cd7ad8e9c8a3ad0')
sha512sums=('cbe6156230b962150eeec53f041889afde71e8818d220aafc69807d3612a1a225f494373220458cfe0f420671684f17541fe3c07f0832cba2722b95d6206e73e'
            'ed8a73b15c4d9441818d558b370344b8b0f8557b204e33fa02ee916b2b71e110f75b6ba59e7d2c2e222a47c75a3686c90b31d2ce8fabe39608a0c9fe07c8c7ef'
            '93bcb884ba3d93fd3417d0ea8640efd0bef8b30bf40b778c7d441ce926dc0021080916d7edc6829a6409c67d8e7b3982765ca94fe5dbfa1ac47e070b5e9e07a7'
            'bca19ef9a33b3587eff00f37a1bb80d922f271c10caa3ac852a7cf7b3f1ca3b2a61330fbc1b3c02d5b05ad751166322c0b7f4b76848f415815346dbd8d8054f1'
            '64f746d18f4da7ce88d43be88718ea7bcb1136358df0c84fe3df2108188bb01ed737a890e3d85e3dbc3dc0636feeadfd1844ea444c00f952fc5634c7abe74cd2'
            'dbe2657e5b9da821f755279c2c798b38ecd4f05f6a8f2cf5f22c5a7b401867bf298f314f1dbc33c7d0c3b8618f4a782922fa2f8afc961ab3daf27ccf9941530a'
            '0c22017dc367998483895301d50ba35c2eb025a09f778b86465d8e32af10e78273a572012d9208ab51605f6a6c668b1e3dcdabae9de6d0d2e3425fb4b4ce437e'
            '06faed6999abb9c99d24947fea076a6392e85cd468e714646b817e5c2a89a5f5203931867f48aa7231743877c4cb01b2eafbbc35ddd0596862e878ef56d9502c')

package() {
  install -dm755 "${pkgdir}/usr/share/office2026"
  bsdtar xf "${srcdir}/office2026.tar.lzma" -C "${pkgdir}/usr/share/office2026"
  # fix ownership
  chown -R root:root "${pkgdir}"

  install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/planmaker26" "${srcdir}/presentations26" "${srcdir}/textmaker26"
  for size in 16 32 48 64 128 256 512; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -s "/usr/share/office2026/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2026-planmaker.png"
    ln -s "/usr/share/office2026/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2026-presentations.png"
    ln -s "/usr/share/office2026/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2026-textmaker.png"

    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -s "/usr/share/office2026/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd26.png"
    ln -s "/usr/share/office2026/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd26.png"
    ln -s "/usr/share/office2026/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd26.png"
    ln -s "/usr/share/office2026/icons/pmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd26-oth.png"
    ln -s "/usr/share/office2026/icons/tmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd26-oth.png"
    ln -s "/usr/share/office2026/icons/pmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd26-mso.png"
    ln -s "/usr/share/office2026/icons/prd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd26-mso.png"
    ln -s "/usr/share/office2026/icons/tmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd26-mso.png"
  done

  install -Dm644 "${srcdir}/softmaker-office-2026.xml" "${pkgdir}/usr/share/mime/packages/softmaker-office-2026.xml"
  install -dm755 "${pkgdir}/usr/share/mime-info"
  ln -s /usr/share/office2026/mime/softmaker-office-2026.mime "${pkgdir}/usr/share/mime-info/softmaker-office-2026.mime"

  install -Dm644 "${srcdir}/planmaker-2026.desktop" "${pkgdir}/usr/share/applications/planmaker-2026.desktop"
  install -Dm644 "${srcdir}/presentations-2026.desktop" "${pkgdir}/usr/share/applications/presentations-2026.desktop"
  install -Dm644 "${srcdir}/textmaker-2026.desktop" "${pkgdir}/usr/share/applications/textmaker-2026.desktop"

  install -Dm644 "${pkgdir}/usr/share/office2026/mime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  bsdtar xOf "${pkgdir}/usr/share/office2026/inst/docs_overwrite_us.zip" license.rtf |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/license.rtf"
}
