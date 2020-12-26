# Maintainer: Sukanka<su975853527 AT gmail.com>
pkgname=svstudio-bin
_pkgname=svstudio
pkgver=1.1.1
pkgrel=1
pkgdesc="Synthesizer V Studio, a high-quality singing synthesis software."
url="https://dreamtonics.com"
arch=('x86_64')
license=('custom')
depends=('libcurl-gnutls' 'webkit2gtk')
provides=("svstudio")
source=(
    "${_pkgname}-${pkgver}.zip::http://synthv-1252644241.file.myqcloud.com/svstudio/${pkgver}/svstudio-basic-linux64-${pkgver}.zip"
    'svstudio.svg'
)
sha512sums=(
    '10ace5725458cf38be4716c50cbdb97f719345796333e540b983748512b748300f684f66743824a4e812eda67a0064cf638a580e6c4e67596ebad0d9b613b105'
    'd361e7557d8aa11dbeea466ed1e60c8c40166788ef9a344c0a7954ded672f408c26d1ce37dc3ba7cb745efbcd41896be9db71f63f51c2a4d59ab62c74ea69998'

)
install=svstudio-bin.install
package(){
    cd "${srcdir}"
    
    mkdir -p ${pkgdir}/opt
    mv "Synthesizer V Studio Basic" ${pkgdir}/opt/${_pkgname}
    cd ${pkgdir}/opt/${_pkgname}
    
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/${_pkgname}/synthv-studio ${pkgdir}/usr/bin/svstudio
    
    
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
    mv *.txt ${pkgdir}/usr/share/licenses/${_pkgname}
    mv docs/third-party ${pkgdir}/usr/share/licenses/${_pkgname}
    mkdir -p ${pkgdir}/opt/${_pkgname}/docs
    ln -s /usr/share/licenses/${_pkgname}/third-party ${pkgdir}/opt/${_pkgname}/docs/third-party
    
    rm -rf license 
    
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
