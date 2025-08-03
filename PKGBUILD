# Maintainer: user981257923
pkgname=vital-synth
pkgver=1.5.5
pkgrel=11
pkgdesc="Spectral warping wavetable synth. Manual download of .deb installer required."
arch=('x86_64')
url="https://vital.audio"
license=('LicenseRef-EULA')
provides=('vital')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7' 'zenity')
install=${pkgname}.install

filename_deb="VitalInstaller.deb"

source=(
    "file://${filename_deb}" 
    "vital.desktop" 
    "vital.png")
sha512sums=(
    'SKIP' 
    'SKIP' 
    'SKIP')

prepare() {

    echo "The AUR moderators have prohibited mirroring ${filename_deb}, so unfortunately \
the users will now be required to manually download the file on their own from ${url}."

}

package() {

	## Extract package data
    if [[ -f "data.tar.gz" ]]; then
        tar xzf data.tar.gz -C "${pkgdir}"
    elif [[ -f "data.tar.xz" ]]; then # In case it's xz compression
        tar xJf data.tar.xz -C "${pkgdir}"
    else
        error "Could not find data.tar.gz or data.tar.xz inside ${filename_deb}. Please check the .deb file."
        exit 1
    fi

    install -D -m644 "${srcdir}/vital.desktop" "${pkgdir}/usr/share/applications/vital.desktop"
    install -D -m644 "${srcdir}/vital.png" "${pkgdir}/usr/share/pixmaps/vital.png"
}