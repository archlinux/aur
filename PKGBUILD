# Maintainer: HelloImWar <helloimwar at proton dot me>

# BEGIN AUTOMATICALLY UPDATED SECTION
_ver=2.6
_pkgrel=1
_buildid=3502
_buildsha512=a1359fe2c9404d4462e64039bb70f8ab2a0e6e2af3f11bf4566c46c3ab01e1f996dbc5470ea4cb93ca0e5fd534ab11a6129af4f4052e876b5970af19208f0878
_buildb2=913b3a8bccac0a0b3e4e5226014a2a5a660cabb5a3c25319d1e93a36e6d9edf9dd9aa698a88c5bf54809a45ac47022f4cd0a0c4cb09ce26e0329783a5c7dd010
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
