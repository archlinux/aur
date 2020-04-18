# Maintainer: robertfoster
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=prey
pkgver=02192009
pkgrel=3
pkgdesc='A FPS based on the id Tech 4 engine using portals and variable gravity. You need the retail game files to play.'
arch=('i686' 'x86_64')
url='http://icculus.org/prey/'
license=('custom')
depends_i686=('alsa-lib' 'libpulse' 'mesa' 'openal' 'sdl')
depends_x86_64=('lib32-alsa-lib' 'lib32-mesa' 'lib32-openal' 'lib32-sdl')
optdepends_i686=(
    'alsa-plugins: pulseaudio-support'
'libpulse: pulseaudio support')
optdepends_x86_64=(
    'lib32-alsa-plugins: pulseaudio-support'
    'lib32-libpulse: pulseaudio support'
'lib32-nvidia-utils: NVIDIA GPU detection')
install='prey.install'
source=(
    ${pkgname}.desktop
    ${pkgname}.launcher
    ${pkgname}ded.launcher
    "http://icculus.org/prey/downloads/${pkgname}-installer-${pkgver}.bin"
)

package() {
    # Create Destination Directory
    install -d "${pkgdir}/opt/${pkgname}/"
    
    # Install Game Files
    cp -r "${srcdir}/data/prey-linux-x86/"* \
    "${pkgdir}/opt/${pkgname}/"
    
    # Install Data Files
    cp -r "${srcdir}/data/prey-linux-data/"* \
    "${pkgdir}/opt/${pkgname}/"
    
    # Install Punkbuster Files
    cp -r "${srcdir}/data/punkbuster-linux-x86/"* \
    "${pkgdir}/opt/${pkgname}/"
    
    # Install Default Config
    cp "${srcdir}/data/configs/english.cfg" \
    "${pkgdir}/opt/${pkgname}/base/default.cfg"
    
    # Install License (Prey)
    install -D -m 0644 "${srcdir}/data/prey_license.txt" \
    "${pkgdir}/usr/share/licenses/$pkgname/prey_license.txt"
    
    # Install License (Punkbuster)
    install -D -m 0644 "${srcdir}/data/punkbuster_license.txt" \
    "${pkgdir}/usr/share/licenses/$pkgname/punkbuster_license.txt"
    
    # Install Desktop Shortcut
    install -D -m 0644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Install Client Launcher
    install -D -m 0755 "${srcdir}/${pkgname}.launcher" \
    "${pkgdir}/usr/bin/${pkgname}"
    
    # Install Ded Launcher
    install -D -m 0755 "${srcdir}/${pkgname}ded.launcher" \
    "${pkgdir}/usr/bin/${pkgname}ded"
    
    # Install Icon
    install -D -m 0755 "${pkgdir}/opt/${pkgname}/${pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Symlinking OpenAL
    if [ "$CARCH" = "x86_64" ]; then
        libarch=32
    else
        libarch=""
    fi
    ln -sr "/usr/lib${libarch}/libopenal.so" \
    "${pkgdir}/opt/${pkgname}/openal.so"
    
    # Cleanup
    rm "${pkgdir}/opt/${pkgname}/${pkgname}.png"
    rm "${pkgdir}/opt/${pkgname}/${pkgname}"
    rm "${pkgdir}/opt/${pkgname}/${pkgname}ded"
}

sha256sums=('a4362a051d42e7b65f1b8359af037974741dd573ce322a61fe095ceadf322410'
    'ffa4f2f80e93f9c7e14ca262f26873f7bc7901d048045934819f98074f870abd'
    '5fb4ba343bf9823bd430a6f46ce08268ed842b4eec315cfaae87408623550df8'
'b3d06fc51afbb5dc88d7e0f9d5267cd9d171edf9d18c84c5f66c8172da74b357')

