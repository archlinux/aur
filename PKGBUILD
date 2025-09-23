# Maintainer: BrLi <brli@chakralinux.org>
# shellcheck disable=SC2034,SC2155,SC2148

pkgname=ttf-twcns-fonts
pkgdesc='Chinese TrueType fonts by Ministry of Education of Taiwan government, support CNS11643 standard, including Kai and Sung fontface.'
pkgver=20250718
pkgrel=1
arch=('any')
url='https://data.gov.tw/dataset/5961'
license=('custom' 'OFL')
source=('https://www.cns11643.gov.tw/opendata/Fonts_Sung.zip'
        'https://www.cns11643.gov.tw/opendata/Fonts_Kai.zip'
        '46-twcns.conf' '66-twcns.conf'
        '政府資料開放授權條款-第一版' 'OGDL-1.0' 'COPYRIGHT')
sha256sums=('0bc3dc65c01791575c4846f6c4827bcb878f7a665a517515c48b702bcb05a72c'
            '32501a9210b47724ae3e1b7945206dd37837b5b3300b83694611627401a6be83'
            'c5f5178b7a54d64ed7602baf92f05a90dfc881cbf6f2fbe0487919efb83a04f9'
            '001c0395c97ba4a95db3f1a390263bf5abe9df989085052e6112c1718534b93f'
            '5752216377a7b59433b2cc83164be2f93533446e72953a1d4769ceddd1349a00'
            '114afb4ba741595b69fbabb5e1d6668f095bbe4acfee5e5358d83cfbc72f1351'
            'f14b044a0bccf49b63b5fb7e6261537d484f0aab69b93e6a082b9baa69be7346')
#DLAGENTS=('https::/usr/bin/wget --progress=bar -c -O %o %u')

package_ttf-twcns-fonts() {
    msg 'Installing the fonts'
    install -dm755 "${pkgdir}"/usr/share/fonts/TTF
    mv -v TW-Sung* "${pkgdir}"/usr/share/fonts/TTF/
    mv -v TW-Kai* "${pkgdir}"/usr/share/fonts/TTF/
    msg 'Installing configuration'
    install -dm755 "${pkgdir}"/usr/share/fontconfig/conf.default
    install -Dm644 "${srcdir}"/46-twcns.conf "${pkgdir}"/usr/share/fontconfig/conf.avail/46-twcns.conf
    install -Dm644 "${srcdir}"/66-twcns.conf "${pkgdir}"/usr/share/fontconfig/conf.avail/66-twcns.conf
    ln -sf ../conf.avail/46-twcns.conf "${pkgdir}"/usr/share/fontconfig/conf.default/46-twcns.conf
    ln -sf ../conf.avail/66-twcns.conf "${pkgdir}"/usr/share/fontconfig/conf.default/66-twcns.conf
    msg 'Installing the license'
    install -Dm644 "${srcdir}"/政府資料開放授權條款-第一版 "${pkgdir}/usr/share/licenses/${pkgname}/政府資料開放授權條款-第一版"
    install -Dm644 "${srcdir}"/OGDL-1.0 "${pkgdir}/usr/share/licenses/${pkgname}/OGDL-1.0"
    install -Dm644 "${srcdir}"/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
    # TODO: proper OFL-1.1 license
}
