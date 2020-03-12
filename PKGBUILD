# Maintainer: Simon Kronberg <Simon.Kronberg@gmail.com>
# Contributor: hawkeye116477 <hawkeye116477@gmail.com>

pkgname=waterfox-current-bin
pkgver=2020.03
pkgrel=2
pkgdesc="64-bit Firefox fork; no telemetry; supports XUL & XPCOM (incl. unsigned) add-ons."
arch=('x86_64')
url="https://www.waterfox.net"
license=('MPL')
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme' 'nss')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("waterfox-current=${pkgver}")
conflicts=('waterfox-current')
replaces=('waterfox-alpha-bin')

source=('waterfox-current.desktop'
        'https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-current-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2')

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}

	# Move the .desktop file and the icon.
	install -m644 "${srcdir}"/waterfox-current.desktop "${pkgdir}"/usr/share/applications/
	install -m644 "${srcdir}"/waterfox/browser/chrome/icons/default/default128.png "${pkgdir}"/usr/share/pixmaps/waterfox-current-icon.png

	# Copy the extracted directory to /opt/.
	cp -r waterfox "${pkgdir}"/opt/waterfox-current

	# Symlink the binary to /usr/bin/.
	ln -s /opt/waterfox-current/waterfox "${pkgdir}"/usr/bin/waterfox-current
}

sha256sums=('4935fc30e327cbb665b6a98ed21a3f0d27b5a1407bbb9988bb7b607a85e0065d'
            '0aa372a14790cf79840d31864a49e01ae07396b7b28b103844780865e5b2feb5') #
