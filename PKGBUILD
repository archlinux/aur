# Maintainer: HelloImWar <helloimwar at proton dot me>

# BEGIN AUTOMATICALLY UPDATED SECTION
_ver=2.6
_pkgrel=1
_buildid=3506
_buildsha512=cd4e7aaa87841322af002fb867ca0577a6636498eb445b40c0f7d8a6360b5ad241b4c391a26fde4961691df076746261959559c9f61cab7989685915b60f76f0
_buildb2=65b4a609a7c5e1ab5f34d281fd29ff164f636cffea6585e57f84532dae10172d4e054d814ea6595e284a8f59b7e83f894c3d1f38d896fe810c99b7861ff98040
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
conflicts=(${_pkgname})
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
