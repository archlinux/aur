# Maintainer:  Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>
# Previous maintainer:  agnotek <agnostic.sn [at]gmail.com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=telegram-desktop-bin-dev
pkgver=0.8.41
pkgrel=1
_dev=1
pkgdesc="Official desktop version of Telegram messaging app - Static binaries, developement version"
arch=('i686' 'x86_64')
url="https://desktop.telegram.org"
license=('GPL3')
depends=('libx11' 'libgcrypt' 'libasyncns' 'libsndfile' 'libsystemd' 'libdbus' 'openal' 'libogg' 'opus' 'opusfile' 'portaudio' 'openssl' 'zlib' 'libexif' 'xz')
conflicts=('telegram-desktop' 'telegram-desktop-bin')
provides=('telegram-desktop')
replaces=('telegram-bin')
install="$pkgname.install"

# Sources
source=("$pkgname.sh" "$pkgname.desktop" "$pkgname.png")
# If this is a dev version
if [ $_dev == 1 ]
then
	_devsuffix=".dev"
else
	_devsuffix=""
fi
# Use this
source_i686=('https://updates.tdesktop.com/tlinux32/tsetup32.'${pkgver}${_devsuffix}'.tar.xz')
source_x86_64=('https://updates.tdesktop.com/tlinux/tsetup.'${pkgver}${_devsuffix}'.tar.xz')
# Checksums
sha256sums=('0f2a6e4c2b9b4ff5f4ddb628728be4cc5a419f79695c0151321a5f234099ee59'
            'e3e10fe8620bd4ed8fda41743ad844739757286eeecea5249cf1fcf21a8431bd'
            '4226167b476a75e844ddf0d429068e7e901bbde516810a7d4ca90f8405c01eef')
sha256sums_i686=('3f06e6f2fe2bf3f784836551913ad0908df59ff519c877e41a6704ee1feb8b20')
sha256sums_x86_64=('f7d2a7d5b4a26d86fba2392d0d34fde54844990adfd12ad1fb1c8dda11d537e5')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/opt/telegram/"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/opt/telegram/"
	install -Dm755 "$srcdir/Telegram/Updater" "$pkgdir/opt/telegram/"

	# Shell wrapper
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/telegram"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/telegram.png"
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"
}
