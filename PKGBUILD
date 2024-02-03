# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-2024-bin
pkgver=1208
pkgrel=1
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations"
url="https://www.softmaker.com"
arch=('x86_64')
license=('LicenseRef-custom')
depends=('hicolor-icon-theme' 'shared-mime-info' 'libxmu' 'libgl' 'libxrandr' 'libxrender'
         'libx11' 'libxext' 'libxmu' 'curl' 'desktop-file-utils' 'gstreamer' 'gst-plugins-base-libs')
source=('planmaker-2024.desktop'
        'presentations-2024.desktop'
        'textmaker-2024.desktop'
        'planmaker24'
        'presentations24'
        'textmaker24'
        'softmaker-office-2024.xml')
source_x86_64=("http://www.softmaker.net/down/softmaker-office-2024-${pkgver//./-}-amd64.tgz")
md5sums=('8230e66ee3219e8216482f9176038b7a'
         '19474c324050b24180be7e693660fda1'
         'bc895b2acaffcfdb90e4b4f95f880ae1'
         '454f59ab470b29aa9b32a5c7a73db752'
         'a6f3599bbc8ea60108a7097b2180c94f'
         '8c416487ae92cb1d9cc098730541b0c2'
         '6d6a3c1dece6d47c5a04c40398c1e8be')
md5sums_x86_64=('1a02cae0c739e2e89f50afae842f2847')
sha512sums=('1b46aa5b78199a120302764a143a7a7512d846aa394d7b28077555f67cd114dcd99eb9f6d679e34f029eb314c020db1eda83111249a465fb56dfc0c93436c4dc'
            '3d60ca8729157ab170454b2a6fd3d7d696e31b1d9b9e325e455a2e3a1a5db57d17fee42366a41547ea7c3957838823bd8ef8805e2b23dc0fdc48544990659d7d'
            '696f80c5fb9d2db1d34e1268ca545669028ee29910975c26e3e83c05dfee248f315b702336600745fe7f20b8ecd3ab75a87ffb571bf91f2b073a7ba7cb36b3bb'
            '107516e6fb1234019b63fd95af1dcaad223325d901fe315b4bab46a9cae11b1d3db5130aa346670cb990cf06f7f0ae6d55200780ead59e54925247455076cd7d'
            '2c9f577e819e7aab96f527ed6562c2b56841d340c7e1d851f4ad96e780f92af1653160b9661bfd3fa6fe208f7d659a4d96cd4e11081840487a7bb14753a79a8a'
            '9be8b6a101b4064e1d14e45d9e81c2867f3e3dbe717820a8c3838685b036415f0584b4d9d999d1b052b675b1f4ee23d1e411321fa66ec63373cbc8ec6341f515'
            '2cf6d62036e88a181b6a0aec73bfe92890901d02cea3bed350fd0297af1e0de0418153c8817d7c79ebf0258c3118023bc6c0300199dbb0fd9d608e16b7b22ae2')
sha512sums_x86_64=('ab7a2ed254da47c7a4595ef4aa6d39b781f51270ea001b728f6cd6e84f3228e408305123cc9679a02b118da98ed8fbdd2a6ee8604e0361f75ec5f0a0e9b7b267')

package() {
  install -dm755 "${pkgdir}/usr/share/office2024"
  bsdtar xf "${srcdir}/office2024.tar.lzma" -C "${pkgdir}/usr/share/office2024"
  # fix ownership
  chown -R root:root "${pkgdir}"

  install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/planmaker24" "${srcdir}/presentations24" "${srcdir}/textmaker24"
  for size in 16 32 48 64 128 256 512; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -s "/usr/share/office2024/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2024-planmaker.png"
    ln -s "/usr/share/office2024/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2024-presentations.png"
    ln -s "/usr/share/office2024/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2024-textmaker.png"

    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -s "/usr/share/office2024/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd24.png"
    ln -s "/usr/share/office2024/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd24.png"
    ln -s "/usr/share/office2024/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd24.png"
    ln -s "/usr/share/office2024/icons/pmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd24-oth.png"
    ln -s "/usr/share/office2024/icons/tmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd24-oth.png"
    ln -s "/usr/share/office2024/icons/pmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd24-mso.png"
    ln -s "/usr/share/office2024/icons/prd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd24-mso.png"
    ln -s "/usr/share/office2024/icons/tmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd24-mso.png"
  done

  install -Dm644 "${srcdir}/softmaker-office-2024.xml" "${pkgdir}/usr/share/mime/packages/softmaker-office-2024.xml"
  install -dm755 "${pkgdir}/usr/share/mime-info"
  ln -s /usr/share/office2024/mime/softmaker-office-2024.mime "${pkgdir}/usr/share/mime-info/softmaker-office-2024.mime"

  install -Dm644 "${srcdir}/planmaker-2024.desktop" "${pkgdir}/usr/share/applications/planmaker-2024.desktop"
  install -Dm644 "${srcdir}/presentations-2024.desktop" "${pkgdir}/usr/share/applications/presentations-2024.desktop"
  install -Dm644 "${srcdir}/textmaker-2024.desktop" "${pkgdir}/usr/share/applications/textmaker-2024.desktop"

  install -Dm644 "${pkgdir}/usr/share/office2024/mime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
