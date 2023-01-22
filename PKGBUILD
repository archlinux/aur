# Maintainer: HelloImWar <helloimwar at proton dot me>

# BEGIN AUTOMATICALLY UPDATED SECTION
_ver=2.6
_pkgrel=1
_buildid=3465
_buildsha512=4b6487751a11094952029713b2f10ca9b0ff08598029a8f4e4ce778adc5a0547456e002b01742f563e75513be543a6d9f4c4d0ad2c9e58a5c76088e1f4c4642c
_buildb2=eeaf8a2a4568ba6e063a6ea7374cb7acaad2542f49a05764709fbdfbfef5f5ad02e0cda0fb63fa9de9cd5368cf2f8641c8624ef6f20eb87f4ab7ac560f9eeaa1
# END AUTOMATICALLY UPDATED SECTION

pkgname=blender-plugin-luxcorerender-latest-bin
_pkgname=${pkgname%-latest-bin}
pkgver="${_ver}.b${_buildid}"
pkgrel=${_pkgrel}
pkgdesc='LuxCoreRender exporter plugin for Blender'
url='https://luxcorerender.org/'
arch=('x86_64')
depends=('blender>=3.0')
license=('GPL')
source=("BlendLuxCore_b${_buildid}.zip::https://dev.azure.com/LuxCoreRender/515e1515-ba0d-4e8f-b7d2-c1710274de10/_apis/build/builds/${_buildid}/artifacts?artifactName=BlendLuxCore&api-version=7.0&%24format=zip")
provides=(${_pkgname})
conflicts=(${_pkgname} "${_pkgname}-bin" "${_pkgname}-git")
sha512sums=(${_buildsha512})
b2sums=(${_buildb2})

package() {
    cd "${srcdir}/BlendLuxCore"
    mv BlendLuxCore-latest-linux64.zip BlendLuxCore-latest-linux64.zip.bak
    rm -f ./*.zip
    mv BlendLuxCore-latest-linux64.zip.bak BlendLuxCore-latest-linux64.zip
    bsdtar xf BlendLuxCore-latest-linux64.zip

    _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=)')
    install -m 755 -d "${pkgdir}/usr/share/blender/${_blender}/scripts/addons"
    cp -a BlendLuxCore "${pkgdir}/usr/share/blender/${_blender}/scripts/addons/luxcorerender"
}
