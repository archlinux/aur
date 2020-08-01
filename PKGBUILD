# Maintainer: Sukanka<su975853527 AT gmail.com>
pkgname=svstudio-bin
_pkgname=svstudio
pkgver=1.0.4
pkgrel=2
pkgdesc="Synthesizer V Studio, a high-quality singing synthesis software."
url="https://dreamtonics.com"
arch=('x86_64')
license=('custom')
depends=('libcurl-gnutls' 'webkit2gtk')
provides=("svstudio")
source=(
    "${_pkgname}.zip::https://dreamtonics.com/synthv/download/Synthesizer%20V%20Studio%20Basic/svstudio-basic-linux64-${pkgver}.zip"
    'svstudio.svg'
)
sha512sums=(
    'ae4a2b7d4b7c1f1e7f2600b26542221d56abf325bbe88e239391f084682a9a120f6feec7bc214f41949e8927c16b1ce8203b839f944f8139888cb46baaa78200'
    'd361e7557d8aa11dbeea466ed1e60c8c40166788ef9a344c0a7954ded672f408c26d1ce37dc3ba7cb745efbcd41896be9db71f63f51c2a4d59ab62c74ea69998'

)

package(){
    cd "${srcdir}/Synthesizer V Studio Basic"
    
    install -D synthv-studio ${pkgdir}/opt/${_pkgname}/synthv-studio
    mkdir -p ${pkgdir}/usr/bin
    
    ln -s /opt/${_pkgname}/synthv-studio ${pkgdir}/usr/bin/svstudio
    mv clf-data ${pkgdir}/opt/${_pkgname}
    
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
    mv license-*.txt ${pkgdir}/usr/share/licenses/${_pkgname}
    mv docs/third-party ${pkgdir}/usr/share/licenses/${_pkgname}
    
    mv fonts ${pkgdir}/opt/${_pkgname}
    
    mv translations ${pkgdir}/opt/${_pkgname}
    
    echo  '''[Desktop Entry]
Name=svstudio
Comment=a high-quality singing synthesis software
Exec=svstudio
Terminal=false
Type=Application
Icon=/usr/share/icon/hicolor/scalable/apps/svstudio.svg
Categories=Utility;
Name[zh_CN.utf8]=svstudio.desktop
''' > svstudio.desktop

    install -D svstudio.desktop  ${pkgdir}/usr/share/applications/svstudio.desktop
    
    install -D ${srcdir}/svstudio.svg   ${pkgdir}/usr/share/icon/hicolor/scalable/apps/svstudio.svg
}
