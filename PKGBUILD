# Maintainer: Dawit Abate <dawitabate2@gmail.com>
pkgname=fcast-receiver-bin
pkgver=23.0.0
pkgrel=1
pkgdesc="Binary releases of Fcast"
arch=('x86_64')
conflicts=("fcast-receiver-bin" "fcast-receiver-git" "fcast-receiver")
provides=("fcast-receiver")
url="https://gitlab.futo.org/videostreaming/fcast"
license=('MIT')
depends=('nss' 'alsa-lib' 'libxext' 'dbus' 'expat' 'libxcb' 'libxrandr' 'nspr' 'at-spi2-core' 'pango' 'glibc' 'libxkbcommon' 'libx11' 'libxcomposite' 'mesa' 'cairo' 'glib2' 'libdrm' 'gcc-libs' 'libxdamage' 'libcups' 'libxfixes' 'gtk3')
source=("${pkgname}-${pkgver}.zip::https://releases.grayjay.app/fcastreceiver/fcast-receiver-linux-x64.zip"
        'fcast-receiver.desktop')
md5sums=('0b0aef8b4f50c0f1d2a104e699471452'
         '787f5a72d47c0b654f08204bf6c495e2')

pkgver() {
    cat "${srcdir}/${pkgname}/version"
}

noextract=(
    "${pkgname}-${pkgver}.zip"
)

prepare() {
    mkdir -p "${srcdir}/${pkgname}"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" -C "${srcdir}/${pkgname}"
}

package() {
    cd "${srcdir}/${pkgname}" 
    install -d "${pkgdir}/opt/${pkgname}/" "${pkgdir}/usr/bin"
    cp -r * "${pkgdir}/opt/${pkgname}/"
    chmod +x "${pkgdir}/opt/${pkgname}/fcast-receiver"
    ln -s "/opt/${pkgname}/fcast-receiver" "${pkgdir}/usr/bin/fcast-receiver"
    install -Dm644 "resources/app/dist/app.png" "${pkgdir}/usr/share/pixmaps/fcast-receiver.png"
    install -Dm644 "${srcdir}/fcast-receiver.desktop" "${pkgdir}/usr/share/applications/fcast-receiver.desktop"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
