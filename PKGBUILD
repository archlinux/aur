# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-2021-bin
pkgver=2021.1016
pkgrel=1
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations"
url="https://www.softmaker.com"
arch=('x86_64')
license=('custom')
depends=('hicolor-icon-theme' 'shared-mime-info' 'libxmu' 'libgl' 'libxrandr' 'libxrender'
         'libx11' 'libxext' 'libxmu' 'curl' 'desktop-file-utils')
source=('planmaker-2021.desktop'
        'presentations-2021.desktop'
        'textmaker-2021.desktop'
        'planmaker21'
        'presentations21'
        'textmaker21'
        'softmaker-office-2021.xml'
        'license-scope.txt')
source_x86_64=("http://www.softmaker.net/down/softmaker-office-${pkgver//./-}-amd64.tgz")
md5sums=('099706015d0caf75c2b84a577344b0bd'
         'e8afc2d2a0c25695b7cf566d72be7801'
         '8c10cddb9608f7687ae5bf5356be96b5'
         'd78fc58f618fa821bb1595542a7ea131'
         '27de947ff56b5e9ad92910c68be83cfa'
         'e1ddaf11756afede521fad32ab5207cd'
         '35c13675d6e89033c1897ca2457c70c2'
         'dd7564d0b83052bf59086391347bebd8')
md5sums_x86_64=('90d76795b716931269b50eceb76dbeee')
sha512sums=('f29dba6cf303e4b2c9e45f039f1793eb838a0bc9d623a4fc1b009fdb0021ccd8c6396a41d2420c0924f4d635fbf330748ec6238573d88d9b0599bd24f7f28d2e'
            'fecf6db647218fe8b2c0288675db225ca992e7e245a06a9d442a3674418f94730a782baeddf9eb482447432bd9543ba60ddaa471a80b56741b4a55c4edac3dc0'
            'b0a1a665a7affae304a34b453dac9b4a8ef2ac17b64e8fe701900f954b494daf0c75a7e62cc53e1b70becc5a3320e372c208787655965c2244d7824a939b5d3f'
            '1a4c94ab9448e267ec30b23f0f50aeb6ecef28aa0c92cf85ec9e13ce3fc54f87006cca351f7aef0eb7421e9890a8d9db0f0b0a839cb8f55730cdba47f6975fae'
            'a2944023917f9efff4ad659640197d47ea7804dd83bf974834b3c4508b3a4dd7f378ca2845e84cb18563c106d0e4512340d6b5a0d7e98e05afe88e184ab9c52e'
            '1677ab6b31683f55bc0b144b787968729048bc4cd66e3e4e334c935488c64bab6baa92258d90ef0dac9fc2b7ec3ae5dd0cf451c63954b07f2d885c4e15937dc4'
            '334d90369b026ef773b7c778ca2fb09e38cae5cb64be0f9bd200010f149364c742f9ac991d597df0a71ee14c082c2fd2fa327df2ef85c6e4693c7e5da8cb14c1'
            '02245e32c6cdaaedaa255d11c94b0948abf3e12b04cb8bf6f799bfb11cea1cf432890bb8ef8a6b1b28038e09339f33a79d3f590fd2bf5bb29b059c3269e2830d')
sha512sums_x86_64=('5d73f7553a38a760c0036f15086f4e28c9f68f2e809440d3370104f4a1cd6ae49a87532965b4b01e02ccd988a67fb25642605ccd17e602997ddcfbde8e2feca1')

package() {
  install -dm755 "${pkgdir}/usr/share/office2021"
  bsdtar xf "${srcdir}/office2021.tar.lzma" -C "${pkgdir}/usr/share/office2021"
  # fix ownership
  chown -R root:root "${pkgdir}"

  install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/planmaker21" "${srcdir}/presentations21" "${srcdir}/textmaker21"
  for size in 16 32 48 64 128 256 512; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -s "/usr/share/office2021/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2021-planmaker.png"
    ln -s "/usr/share/office2021/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2021-presentations.png"
    ln -s "/usr/share/office2021/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/office2021-textmaker.png"

    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -s "/usr/share/office2021/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd21.png"
    ln -s "/usr/share/office2021/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd21.png"
    ln -s "/usr/share/office2021/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd21.png"
    ln -s "/usr/share/office2021/icons/pmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd21-oth.png"
    ln -s "/usr/share/office2021/icons/tmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd21-oth.png"
    ln -s "/usr/share/office2021/icons/pmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd21-mso.png"
    ln -s "/usr/share/office2021/icons/prd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd21-mso.png"
    ln -s "/usr/share/office2021/icons/tmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd21-mso.png"
  done

  install -Dm644 "${srcdir}/softmaker-office-2021.xml" "${pkgdir}/usr/share/mime/packages/softmaker-office-2021.xml"
  install -dm755 "${pkgdir}/usr/share/mime-info"
  ln -s /usr/share/office2021/mime/softmaker-office-2021.mime "${pkgdir}/usr/share/mime-info/softmaker-office-2021.mime"

  install -Dm644 "${srcdir}/planmaker-2021.desktop" "${pkgdir}/usr/share/applications/planmaker-2021.desktop"
  install -Dm644 "${srcdir}/presentations-2021.desktop" "${pkgdir}/usr/share/applications/presentations-2021.desktop"
  install -Dm644 "${srcdir}/textmaker-2021.desktop" "${pkgdir}/usr/share/applications/textmaker-2021.desktop"

  install -Dm644 "${srcdir}/license-scope.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-scope.txt"
  install -Dm644 "${pkgdir}/usr/share/office2021/mime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
