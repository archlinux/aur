# Maintainer: HelloImWar <helloimwar at proton dot me>

# BEGIN AUTOMATICALLY UPDATED SECTION
_ver=2.6
_pkgrel=1
_buildid=3501
_buildsha512=6b8698d51778f85278c9584d5f586a3b821b4b2f06171801299bb678ddb7f98dfce2db3cb77dc6eca3cfabba38a9140d72977d2f1ec8171d2cc47307234377cf
_buildb2=0e0ee01743631041a53e256f5ab8e2f4c8fec63d7a55eff4b36fd7bf6f2915618e86ec0e3d794ce3c32fc36454ebb7689c6a34a26fb43803b8772de7ab2e0317
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
