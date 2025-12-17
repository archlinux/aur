# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-2024-bin
pkgver=1230
pkgrel=1
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations"
url="https://www.softmaker.com"
arch=('x86_64')
license=('LicenseRef-custom')
depends=('bash' 'gcc-libs' 'glib2' 'hicolor-icon-theme' 'shared-mime-info' 'libxmu' 'libgl' 'libxrandr' 'libxrender'
         'libx11' 'libxext' 'libxmu' 'curl' 'desktop-file-utils' 'glibc' 'gstreamer' 'gst-plugins-base-libs' 'zlib')
source=('planmaker-2024.desktop'
        'presentations-2024.desktop'
        'textmaker-2024.desktop'
        'planmaker24'
        'presentations24'
        'textmaker24'
        'softmaker-office-2024.xml'
        "http://www.softmaker.net/down/softmaker-office-2024-${pkgver//./-}-amd64.tgz")
md5sums=('01c5dab03b945e273de59e18b12b8a05'
         '9023c1ffae65d48a746585af91f06e5a'
         'b8a94387da8199daf7558df0669c1d18'
         '454f59ab470b29aa9b32a5c7a73db752'
         'a6f3599bbc8ea60108a7097b2180c94f'
         '8c416487ae92cb1d9cc098730541b0c2'
         '6d6a3c1dece6d47c5a04c40398c1e8be'
         '5abb8fc986f76aef70e0fc3fd9ea0b0d')
sha512sums=('a4e4802efe9dd9f85c12e01c08061c4e3c6fc14a910c6bc429ab4e6b96dc90588013302ee68f408e8bdf7896297356f2fadcfa8c1c7de7f0ecf1f91e14eba22b'
            '7e896c27805d58b6c966dd6c8fe1db1332bd01e3f6f17f582a290f9a41b238f6f16227d9d4f870960841ed6f26b7e1454cbe1483a6798f8e76c1a178b0ab375d'
            'adae5b514042cea457dfc9c5923702f2202192416210be3de6af0f49f5aaa1b2b7db2abee99472e8fd13e206095d2799c29094b9f111c921907f081c816e93bc'
            '107516e6fb1234019b63fd95af1dcaad223325d901fe315b4bab46a9cae11b1d3db5130aa346670cb990cf06f7f0ae6d55200780ead59e54925247455076cd7d'
            '2c9f577e819e7aab96f527ed6562c2b56841d340c7e1d851f4ad96e780f92af1653160b9661bfd3fa6fe208f7d659a4d96cd4e11081840487a7bb14753a79a8a'
            '9be8b6a101b4064e1d14e45d9e81c2867f3e3dbe717820a8c3838685b036415f0584b4d9d999d1b052b675b1f4ee23d1e411321fa66ec63373cbc8ec6341f515'
            '2cf6d62036e88a181b6a0aec73bfe92890901d02cea3bed350fd0297af1e0de0418153c8817d7c79ebf0258c3118023bc6c0300199dbb0fd9d608e16b7b22ae2'
            'cbea724a345e186254d8215d2c1a743c3b84fead0425f462e05f51da4661dd3d973162c0d706ed024834b9da82298e6a7998fc0f4bec95cc669b13900b3fbf88')

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
