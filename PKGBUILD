# Maintainer: Sukanka<su975853527 AT gmail.com>
pkgname=svstudio-bin
_pkgname=svstudio
pkgver=1.11.2
pkgrel=1
pkgdesc="Synthesizer V Studio, a high-quality singing synthesis software."
url="https://dreamtonics.com"
arch=('x86_64')
license=('custom')
depends=('hicolor-icon-theme')
provides=("svstudio")
source=(
    "${_pkgname}-${pkgver}.zip::https://download.dreamtonics.com/svstudio/1.11.2-K5cYcfVuYsejairEBpQ3-2/svstudio-basic-linux64.zip"
    'svstudio.svg'
    'svstudio.desktop'
)
# use curl 'https://auth.dreamtonics.com/update.php?operation=fetch-update&product=Synthesizer%20V%20Studio%20Basic&key&current-version=67073&platform=linux' to get latest download link
sha512sums=('6e52dc923f059b48c5c8000caba3ec866ab105287537968d7ebc547e73278ec262ecc3c5b112340094369b1c383460198d996970276bf7b229f999d3fb4fc7a0'
    'ee2fbe1a3d4c63f2fed31368396c4b3315fbe01368341ce73d7d4c1cb5e0fe3d9f529083ce45890a860624debc57543e2a873940c4fa14135f4e5f013d88cde2'
    'bf95cea8be7def9c9e108b584efa247baec68eacc9afc1192fa4ff6368290d570ff958f9fbd1997d33df6c33c4d4dbaea673c36c6156e9a353a70991edc327f9')
# install=svstudio-bin.install

package() {
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

    install -D ${srcdir}/svstudio.desktop ${pkgdir}/usr/share/applications/svstudio.desktop
    install -D ${srcdir}/svstudio.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/svstudio.svg
    chmod a+w -R ${pkgdir}/opt/${_pkgname}

}
