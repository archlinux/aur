# Maintainer: champignoom <champignoom@gmail.com>

# Instructions were copied from ttf-ms-win10
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed and up-to-date Windows 10
# system or the most recent install medium.
#
# On the installed Windows 10 system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\Licenses\neutral\_Default\Core\license.rtf
#
# How to acquire fonts from Windows 10 install medium:
#
#    You can freely download the Windows 10 Enterprise 90-day evaluation from:
#
#       http://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise
#
#    Fonts are located in 'sources/install.wim' file on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#
#    You can extract WIM using wimextract ('wimlib' package) or 7z ('p7zip').
#
#    Put the following script together with previously extracted
#    'install.wim' and execute:
#
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} --dest-dir fonts
#
#    Fonts and license will be located in the 'fonts' dir.
#
# You need all files listed in the _ttf_ms_win10_fod_zh_cn arrays.Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgname=ttf-ms-win10-fod-zh_cn
pkgver=10.0.18362.116
pkgrel=1
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
# provides=(ttf-font)
conflicts=(ttf-vista-fonts)

_ttf_ms_win10_fod_zh_cn=(
    Deng.ttf       # DengXian
    Dengb.ttf      # DengXian Bold
    Dengl.ttf      # DengXian Light
    simfang.ttf    # FangSong
    simhei.ttf     # SimHei
    simkai.ttf     # KaiTi
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(${_ttf_ms_win10_fod_zh_cn[@]/#/file://}
        file://license.rtf)

sha256sums=(
        '765be9ce80a602fca63934de9d12847743e0de6401c9306ae4416e2eabdaff06'
        '068c30d238a6f8426083cf77f4f4319a4dd53aff1ec53992fb428e8cef087ccd'
        '7b47625d0127a2772203c753be965101e75582a51b9d306982a7a72bc66ec0ad'
        '3e2d44b01c9a248a61bedae4f15c8aae501328b1f7adfe6e111a5da5aa5c5104'
        'aa4560dd8fe5645745fed3ffa301c3ca4d6c03cbd738145b613303961ba733b8'
        '9dd76f7ab430edd091db24c3f18e71410325c1414141aad5fe67947873ffba06'
        'SKIP')

_package() {
        install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
        install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package() {
    pkgdesc='Microsoft Windows 10 Simplified Chinese Feature On Demand (FOD) Supplemental TrueType Fonts'
        _package ${_ttf_ms_win10_fod_zh_cn[@]}
}

# vim: ts=4 sw=4 et
