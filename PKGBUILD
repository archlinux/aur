# Maintainer: SirNapkin <sirnapkin@protonmail.com>
# Contributor: Anna <morganamilo@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>
# Contributor: Parker Reed <parker.l.reed@gmail.com>
# Contributor: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# Contributor: Cayde Dixon <me@cazzar.net>
# Contributor: Anthony Anderson <aantony4122@gmail.com>

# This is mostly the discord-canary package, but modified to install Discord Development

pkgname=discord-development
pkgver=0.0.126
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discord.com/'
provides=('discord')
license=('custom')
depends=('gtk3' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'xdg-utils' 'libcups')
optdepends=('libpulse: For pulseaudio support'
            'noto-fonts-emoji: Google font for emoji support.'
            'ttf-symbola: Font for emoji support.'
            'noto-fonts-cjk: Font for special characters such as /shrug face.')
source=("https://dl-development.discordapp.net/apps/linux/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE"
        "${pkgname}.sh")
sha256sums=('ff599e923dbc7e874a4fc4ff91fdeebedf40f728ff263a81208ddfb0b99be069'
            'a7c01ba4de8e8ddabfe4a2d434b9c1d05b5fdbd44b1b8ca2164b89a9657a930d'
            '105aa35a4babefed67893e3f62a5f8d758abc958edbde7c6a6686b403ac24f6b')

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

