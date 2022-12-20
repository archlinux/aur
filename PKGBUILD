# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-2021-bin
pkgver=2021.1060
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
md5sums=('977caa68fee4db85d1c6c565fdfa4256'
         'e8afc2d2a0c25695b7cf566d72be7801'
         '8c10cddb9608f7687ae5bf5356be96b5'
         'd78fc58f618fa821bb1595542a7ea131'
         '27de947ff56b5e9ad92910c68be83cfa'
         'e1ddaf11756afede521fad32ab5207cd'
         '35c13675d6e89033c1897ca2457c70c2'
         '66f9488ab5e2b93f82534b1d8e7b20d3')
md5sums_x86_64=('07b62f5f162fe7fe66079538c1e1721f')
sha512sums=('7c8af74aad1b36412e24b0d8f4d3ead3ae2dafa8af832795e202cdfb2536e38fed905da8894d85dbe9b8d3aa2991974c992bbdd38b7dbc68cea10b7e6bffdfcb'
            'fecf6db647218fe8b2c0288675db225ca992e7e245a06a9d442a3674418f94730a782baeddf9eb482447432bd9543ba60ddaa471a80b56741b4a55c4edac3dc0'
            'b0a1a665a7affae304a34b453dac9b4a8ef2ac17b64e8fe701900f954b494daf0c75a7e62cc53e1b70becc5a3320e372c208787655965c2244d7824a939b5d3f'
            '1a4c94ab9448e267ec30b23f0f50aeb6ecef28aa0c92cf85ec9e13ce3fc54f87006cca351f7aef0eb7421e9890a8d9db0f0b0a839cb8f55730cdba47f6975fae'
            'a2944023917f9efff4ad659640197d47ea7804dd83bf974834b3c4508b3a4dd7f378ca2845e84cb18563c106d0e4512340d6b5a0d7e98e05afe88e184ab9c52e'
            '1677ab6b31683f55bc0b144b787968729048bc4cd66e3e4e334c935488c64bab6baa92258d90ef0dac9fc2b7ec3ae5dd0cf451c63954b07f2d885c4e15937dc4'
            '334d90369b026ef773b7c778ca2fb09e38cae5cb64be0f9bd200010f149364c742f9ac991d597df0a71ee14c082c2fd2fa327df2ef85c6e4693c7e5da8cb14c1'
            '41fd130546ed40b4241e2e97187286742d3d0e033c16448e6d644e27c763196196e839f663d462a00a01f94e2becba4700b487b668a4fd356f6b91bacc29ab7a')
sha512sums_x86_64=('36d6cf49c3dce821f50ebef60e6ae48cd97ad9507cb7af7bc1500977c03d24f197b7b7036e92b9b5c3bc387d1d3fac2cc156022e4294c71ad998e8e8e3649c9d')

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
