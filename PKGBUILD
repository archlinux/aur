# Maintainer: user981257923
pkgname=vital-synth
pkgver=1.5.5
pkgrel=14
pkgdesc="Spectral warping wavetable synth. Manual download of .deb installer required."
arch=('x86_64')
url="https://vital.audio"
license=('LicenseRef-EULA')
provides=('vital')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7' 'zenity')

_debfile="VitalInstaller.deb"

source=(
    "file://${_debfile}" 
    "vital.desktop" 
    "vital.png")
sha512sums=(
    'SKIP' 
    'd7b82c3d659e6c618769be815c756c4858f96fdb417a080fae03e4018abb01a3bd087588c1f4cfd2e6017ed0f3bcd8cdfe2b7d6e4515a9ff3d8e0a4d053f6961' 
    '71bf957de309ae5b3dda1ccbe0fa76d0f6d5d22f5e184bb0f3f114ed69c3e87fe9d62bea18fc0d9eeaf7b4bcb5e2d2cebad2174341d28eda834f5ec083ebf4f6')

prepare() {

    echo "The AUR moderators have prohibited mirroring ${_debfile}, so unfortunately \
the users will now be required to manually download the file on their own from ${url}."

}

package() {

	## Extract package data
    if [[ -f "data.tar.gz" ]]; then
        tar xzf data.tar.gz -C "${pkgdir}"
    elif [[ -f "data.tar.xz" ]]; then # In case it's xz compression
        tar xJf data.tar.xz -C "${pkgdir}"
    else
        error "Could not find data.tar.gz or data.tar.xz inside ${_debfile}. Please check the .deb file."
        exit 1
    fi

    install -D -m644 "${srcdir}/vital.desktop" "${pkgdir}/usr/share/applications/vital.desktop"
    install -D -m644 "${srcdir}/vital.png" "${pkgdir}/usr/share/pixmaps/vital.png"
}