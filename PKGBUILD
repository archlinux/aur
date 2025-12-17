# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-nx-bin
pkgver=1230
pkgrel=1
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations (subscription version)"
url="https://www.softmaker.com"
arch=('x86_64')
license=('LicenseRef-custom')
depends=('bash' 'gcc-libs' 'glib2' 'hicolor-icon-theme' 'shared-mime-info' 'libxmu' 'libgl' 'libxrandr' 'libxrender'
         'libx11' 'libxext' 'libxmu' 'curl' 'desktop-file-utils' 'glibc' 'gstreamer' 'gst-plugins-base-libs' 'zlib')
source=('planmaker-nx.desktop'
        'presentations-nx.desktop'
        'textmaker-nx.desktop'
        'planmakernx'
        'presentationsnx'
        'textmakernx'
        'softmaker-office-nx.xml'
        "http://www.softmaker.net/down/softmaker-office-nx-${pkgver//./-}-amd64.tgz")
md5sums=('95fc61a87e75e525abb5b446c4e29635'
         '9f2e85b3a31a17e22f3f2ca12b3c3971'
         'bd46ae557dc18789e7ad3b00a0869258'
         '9fd70f26916db5e641a3d7727df4223d'
         '052615de9b1733596832e95b22d47551'
         '8b5e74ccb7ed223db25d0cafea36d36f'
         'f750f31e92221d88b72f8de1075a960f'
         '1356d541b7304848f5ae326420d7b04c')
sha512sums=('a2b8db4e2028bce38f37c9da2e5733aceea17cd9ebd7e96c1252e328cc7fd3e940c71967a9f41d2b04f874d86ee0050f22cead313e5fd9b5e396a6a704f475e2'
            'fc0b0dac264df8d1a9301c6c934dc5bc6cbc2c7e6eb06a109b60e2d58429f3a61117e12585c0e42388c8b064e3ac6e55e513d1c01dc8cea5999fed7e2342e449'
            'e729b7dc4246ed72fcd36e11b8dcb7880eee6b0c4cfd0837a788bab46bc9d585657171b187736e1fa4eaaf83897f285fdef720b6bb4593ef153517f549ed4934'
            '69285ac7d4c6c0bb0a1bce9ed9a1619748fb12c6304dd1ca6ee0878250bf4345761a9b96ba23de6bc190fdb1c53fb5d11eb5d719a24998d449c1a223cb8e244f'
            '134fbddc26091d3e8dff602d67e7bd2e01e0e6b1a0b77266b289781d912684c890f54c1b8922fd8a8c3fba21439a00a4e355bb23a1816d6b13ec1576fcb53c3e'
            '83879bc58e22b58df193ef9434a292b3c4108d72000db85a7739317ecd10630c6ae578a97947a95c782f3838e6f155ce093399a42dc0044e623d5a437f1d4550'
            '94bb97083f6630b883cf1f642a5170ef17de088bfa78210068b9bf65107cc2a5984927f49014cd8040a55d9e0723d3de8ee30875f3dc3bc4f752181d7e04893d'
            'c0b7d998553d101fd2e4b1c76c49303c0263b5d0d5ece6569a13c70b699b736a937fc33dfddb4466b7d9cc185ba65cf6e207300dfb5a5a61b24a18390483e9f5')

package() {
  install -dm755 "${pkgdir}/usr/share/officenx"
  bsdtar xf "${srcdir}/officenx.tar.lzma" -C "${pkgdir}/usr/share/officenx"
  # fix ownership
  chown -R root:root "${pkgdir}"

  install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/planmakernx" "${srcdir}/presentationsnx" "${srcdir}/textmakernx"
  for size in 16 32 48 64 128 256 512; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -s "/usr/share/officenx/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-planmaker.png"
    ln -s "/usr/share/officenx/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-presentations.png"
    ln -s "/usr/share/officenx/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-textmaker.png"

    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -s "/usr/share/officenx/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx.png"
    ln -s "/usr/share/officenx/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prdnx.png"
    ln -s "/usr/share/officenx/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx.png"
    ln -s "/usr/share/officenx/icons/pmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx-oth.png"
    ln -s "/usr/share/officenx/icons/tmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx-oth.png"
    ln -s "/usr/share/officenx/icons/pmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx-mso.png"
    ln -s "/usr/share/officenx/icons/prd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prdnx-mso.png"
    ln -s "/usr/share/officenx/icons/tmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx-mso.png"
  done

  install -Dm644 "${srcdir}/softmaker-office-nx.xml" "${pkgdir}/usr/share/mime/packages/softmaker-office-nx.xml"
  install -dm755 "${pkgdir}/usr/share/mime-info"
  ln -s /usr/share/officenx/mime/softmaker-office-nx.mime "${pkgdir}/usr/share/mime-info/softmaker-office-nx.mime"

  install -Dm644 "${srcdir}/planmaker-nx.desktop" "${pkgdir}/usr/share/applications/planmaker-nx.desktop"
  install -Dm644 "${srcdir}/presentations-nx.desktop" "${pkgdir}/usr/share/applications/presentations-nx.desktop"
  install -Dm644 "${srcdir}/textmaker-nx.desktop" "${pkgdir}/usr/share/applications/textmaker-nx.desktop"

  install -Dm644 "${pkgdir}/usr/share/officenx/mime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
