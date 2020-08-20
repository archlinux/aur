# Maintainer: Sukanka<su975853527 AT gmail.com>
pkgname=svstudio-bin
_pkgname=svstudio
pkgver=1.0.5
pkgrel=1
pkgdesc="Synthesizer V Studio, a high-quality singing synthesis software."
url="https://dreamtonics.com"
arch=('x86_64')
license=('custom')
depends=('libcurl-gnutls' 'webkit2gtk')
provides=("svstudio")
source=(
    "${_pkgname}-${pkgver}.zip::https://dreamtonics.com/synthv/download/Synthesizer%20V%20Studio%20Basic/svstudio-basic-linux64-${pkgver}.zip"
    'svstudio.svg'
)
sha512sums=(
    '8a61404821130a0adb15d4b547cbd0290372d0740d933d10a7fcb9e85ea9d24f47de0b2694e7e1804de658ace34f18be679cf69a55dcd45dcf64ec6699ae4190'
    'd361e7557d8aa11dbeea466ed1e60c8c40166788ef9a344c0a7954ded672f408c26d1ce37dc3ba7cb745efbcd41896be9db71f63f51c2a4d59ab62c74ea69998'

)
install=svstudio-bin.install
package(){
    cd "${srcdir}/Synthesizer V Studio Basic"
    
    install -D synthv-studio ${pkgdir}/opt/${_pkgname}/synthv-studio
    mkdir -p ${pkgdir}/usr/bin
    
    ln -s /opt/${_pkgname}/synthv-studio ${pkgdir}/usr/bin/svstudio
    mv clf-data ${pkgdir}/opt/${_pkgname}
    mv databases ${pkgdir}/opt/${_pkgname}
    
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
    mv license-*.txt ${pkgdir}/usr/share/licenses/${_pkgname}
    mv docs/third-party ${pkgdir}/usr/share/licenses/${_pkgname}
    mkdir -p ${pkgdir}/opt/${_pkgname}/docs
    ln -s /usr/share/licenses/${_pkgname}/third-party ${pkgdir}/opt/${_pkgname}/docs/third-party
    
    mv fonts ${pkgdir}/opt/${_pkgname}
    
    mv translations ${pkgdir}/opt/${_pkgname}
    
    echo  '''[Desktop Entry]
Name=svstudio
Comment=a high-quality singing synthesis software
Exec=svstudio %f
Terminal=false
Type=Application
Icon=/usr/share/icon/hicolor/scalable/apps/svstudio.svg
MimeType=application/tup;
Categories=AudioVideo;Audio;AudioVideoEditing;
Name[zh_CN.utf8]=svstudio.desktop
''' > svstudio.desktop

    install -D svstudio.desktop  ${pkgdir}/usr/share/applications/svstudio.desktop
    
    install -D ${srcdir}/svstudio.svg   ${pkgdir}/usr/share/icon/hicolor/scalable/apps/svstudio.svg
}
