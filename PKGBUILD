# Maintainer: HelloImWar <helloimwar at proton dot me>

# BEGIN AUTOMATICALLY UPDATED SECTION
_ver=2.6
_buildid=3429
_buildsha512=a367a139a09aad28a28d7b8ca42b2f23801083a79cb0c9242de1710e86b6a5c51673d7c9ece28691faf6ed0cd3eb766c4f174475858b28bec04ae28c5cac7ec0
_buildb2=be7187f5ee1b1f3c2e1916dedef8cf5d462771112712eae858973f8a8efdd3bf3ab5b152ce0c25af420cb8c3639a22c23e7fa2de2b9d1a72c0657d804a408742
# END AUTOMATICALLY UPDATED SECTION

pkgname=blender-plugin-luxcorerender-latest-bin
_pkgname=${pkgname%-latest-bin}
pkgver="${_ver}.b${_buildid}"
pkgrel=1
pkgdesc='LuxCoreRender exporter plugin for Blender'
url='https://luxcorerender.org/'
arch=('x86_64')
depends=('blender>=2.80')
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
