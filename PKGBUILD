# Maintainer: Neko-san < nekoNexus at protonmail dot ch >

pkgname=striked-bin
pkgver=0.0.3
pkgdesc='A community communication platform for game development studios to create, sell, and distribute video games'
pkgrel=1
arch=(x86_64)
url="https://${pkgname/-bin/}.gg"
license=('custom' 'MIT' 'Apache')
depends=(
    'libxdamage'
    'libxcomposite'
    'at-spi2-core'
    'libxfixes'
    'mesa'
    'libxcb'
    'pango'
    'glib2'
    'gtk3'
    'nspr'
    'nss'
    'dbus'
    'libxext'
    'hicolor-icon-theme'
    'libcups'
    'bash'
    'cairo'
    'glibc'
    'libxrandr'
    'libx11'
    'gcc-libs'
    'libxkbcommon'
    'alsa-lib'
    'libdrm'
    'expat'
)
makedepends=('coreutils')
optdepends=()
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")
options=(!strip)
source=(
    "https://media.${pkgname/-bin/}.gg/user-data/launcher/linux_x64_0.0.3.rpm"
    "striked.sh"
)
sha256sums=(
    'ecb149596ef87413ec71121c58e218af9717cb23c0de874729d3b4d92a103273'
    'fa7571e68bdc16edd09b2aeed647f71aadaaf82cebd84891738297d66cdb56f6'
)

# build() {
#     
# }

package() {
    # Main files
    install -dm755 "${pkgdir}/opt/Striked Launcher"
    ## Doesn't seem to respect unprivileged user permissions after installation? Doing this doesn't seem to make a difference
    ## Calling the striked binary directly instead of with the desktop file desn't seem to work correctly
    # chmod -R 777 "${pkgdir}/opt/Striked Launcher"
    install -dm755 "${pkgdir}/usr"
    mv "${srcdir}/opt/Striked Launcher/"* "${pkgdir}/opt/Striked Launcher"
    mv "${srcdir}/usr/"* "${pkgdir}/usr"

    # Symlink to /usr/bin
    install -Dm755 "${srcdir}/striked.sh" "${pkgdir}/usr/bin/striked"
    
    # Licenses
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${pkgdir}/opt/Striked Launcher/LICENSE"* "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 644 "${pkgdir}/usr/share/licenses/${pkgname}/"*
}
