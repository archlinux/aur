# Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Thanks to: Simon Kronberg <Simon.Kronberg@gmail.com>

pkgname=waterfox-classic-bin
pkgver=2019.10
pkgrel=1
pkgdesc="Privacy oriented Firefox fork."
arch=('x86_64')
url="https://www.waterfoxproject.org"
license=('MPL')
depends=('libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
optdepends=('alsa-lib' 'pulseaudio')
provides=('waterfox')
conflicts=('waterfox-bin')

source=(
    'waterfox-classic.desktop'
    'https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-classic-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2'
    )

package() {
    # Create the directories.
    install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}

    # Install the desktop and the icon files.
    install -m644 "${srcdir}"/waterfox-classic.desktop "${pkgdir}"/usr/share/applications/
    install -m644 "${srcdir}"/waterfox/browser/chrome/icons/default/default128.png "${pkgdir}"/usr/share/pixmaps/waterfox-classic-icon.png

    # Copy the directory to /opt
    cp -r waterfox "${pkgdir}"/opt/waterfox-classic

    # Symlink the binary to /usr/bin
    ln -s /opt/waterfox-classic/waterfox "${pkgdir}"/usr/bin/waterfox-classic
}

sha256sums=('2000a84a25663de700895f1a605680b64a0372f47f0b9bc03d77c8f5933ef2df'
            'a0770333bdf6bdf511342c47cc946c6b1d59e305f59161149cac2ebada577818')
