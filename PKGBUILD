# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

# Instructions were copied from ttf-ms-win8 and slightly modified:
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
#       C:\Windows\System32\license.rtf
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
#    You can extract WIM using wimextract ('wimlib' package from AUR) or
#    7z ('p7zip').
#
#    Put the following script together with previously extracted
#    'install.wim' and execute:
#
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} --dest-dir fonts
#
#    Fonts and license will be located in the 'fonts' dir.
#
# You need all files listed in the _ttf_wps_win10[_*] arrays.Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgname=ttf-wps-win10
pkgver=1.0.0
pkgrel=3
pkgdesc='Symbol fonts required by wps-office from Microsoft Windows 10'
arch=('any')
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=('custom')
provides=('ttf-wps-fonts')
conflicts=('ttf-wps-fonts')
_ttf_wps_win10=('MTEXTRA.TTF'
                'symbol.ttf'
                'webdings.ttf'
                'wingding.ttf'
                'WINGDNG2.TTF'
                'WINGDNG3.TTF')
source=("${_ttf_wps_win10[@]/#/local://}"
        'local://license.rtf')
sha256sums=('6c469962f33b7222f07b8d1ae8025f177f4a5f5db3eb62fa1523f261a270991f'
            'bffdc2fd675d9af414824ae84d8456504542480afb34fbc6bfd6903656c4f854'
            '1161ce511c44eb5464a4f8144aaf3eb965a50ed66957ad7d38e497ab9d958e5a'
            'd7c38355bd52f52e043ed904f3463d476925300d1bdca9e842b28077ca3549b8'
            'fa671b6fddedd57f158ab90b6aa6a7c33db6f41ab620db72b7ad1e57c38bda5f'
            'ac9ee085920a3d8b076d5e0c61dc9df42c4bac28d1fc968344f9ceddb3972f69'
            '4c124cdeee01e97dd5efcff4ecba2acdae8b9c816f2d92f86673231347dc3100')

package() {
  for font in "${_ttf_wps_win10[@]}"; do
    install -Dm644 "${font}" -t "${pkgdir}/usr/share/fonts/TTF/"
  done
  install -Dm644 license.rtf -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
