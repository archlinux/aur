# Maintainer: Moiré <mail@moire.cx>
# Contributor: Anna <morganamilo@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>
# Contributor: Parker Reed <parker.l.reed@gmail.com>
# Contributor: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# Contributor: Cayde Dixon <me@cazzar.net>
# Contributor: Anthony Anderson <aantony4122@gmail.com>

# This is mostly the discord-canary package, but modified to install Discord Development

pkgname=discord-development
pkgver=0.0.8
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discord.com/'
license=('custom')
depends=('gtk3' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'xdg-utils' 'libcups')
optdepends=('libpulse: For pulseaudio support'
            'noto-fonts-emoji: Google font for emoji support.'
            'ttf-symbola: Font for emoji support.'
            'noto-fonts-cjk: Font for special characters such as /shrug face.')
source=("https://dl-development.discordapp.net/apps/linux/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE"
        "${pkgname}.sh")
sha256sums=('143d2aa332f234c3d5a5d0f8d80fe9ce2c17eed28fdfff6614322a75fe25a291'
            'a7c01ba4de8e8ddabfe4a2d434b9c1d05b5fdbd44b1b8ca2164b89a9657a930d'
            '9bfd406c319038b095d4b87ade82aa1cafab5c485de73b7e207189b29c2bb0d4')

package() {
    # Install the main files.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/DiscordDevelopment/." "${pkgdir}/opt/${pkgname}"

    # Desktop Entry
    install -Dm644 "${pkgdir}/opt/${pkgname}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    sed -i "s%share/${pkgname}/DiscordDevelopment%bin/${pkgname}%" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Wrapper script enabling --no-sandbox
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Create symbolic link to the icon
    install -d "${pkgdir}/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/discord.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # License
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

