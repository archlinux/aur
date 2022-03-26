# Maintainer: Sukanka<su975853527 AT gmail.com>
pkgname=svstudio-bin
_pkgname=svstudio
pkgver=1.6.0
pkgrel=1
pkgdesc="Synthesizer V Studio, a high-quality singing synthesis software."
url="https://dreamtonics.com"
arch=('x86_64')
license=('custom')
depends=('libcurl-gnutls' 'webkit2gtk')
provides=("svstudio")
source=(
    "${_pkgname}-${pkgver}.zip::https://resource.dreamtonics.com/download/Synthesizer%20V%20Studio%20Basic/${pkgver}/svstudio-basic-linux64.zip"
    'svstudio.svg'
    'svstudio.desktop'
)
sha512sums=('defbb5d0f5a53c33b83ff34c4741d0345b2e207bbf0dcc27845e3c22e49f977dd4e5c5563a5820f12da20b21aed8acaeacfea468708ead3dc508b2e0be004f65'
            'ee2fbe1a3d4c63f2fed31368396c4b3315fbe01368341ce73d7d4c1cb5e0fe3d9f529083ce45890a860624debc57543e2a873940c4fa14135f4e5f013d88cde2'
            'bf95cea8be7def9c9e108b584efa247baec68eacc9afc1192fa4ff6368290d570ff958f9fbd1997d33df6c33c4d4dbaea673c36c6156e9a353a70991edc327f9')
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
    
    

    install -D ${srcdir}/svstudio.desktop  ${pkgdir}/usr/share/applications/svstudio.desktop
    install -D ${srcdir}/svstudio.svg   ${pkgdir}/usr/share/icons/hicolor/scalable/apps/svstudio.svg
    
}
