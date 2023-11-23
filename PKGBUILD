pkgname=mixbus9
pkgver=9.2.172
pkgrel=1
pkgdesc="Harrison Consoles Mixbus DAW (Version 9)"
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/mixbus"
license=('EULA')
groups=('pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs')
optdepends=('avldrums.lv2: AVLinux drumkits'
			'gmsynth.lv2: General MIDI LV2 Synth'
			'setbfree-lv2: Tonewheel organ'
			'x42-plugins-lv2: Set of plugins and utilities from the X42 Project')
source=("https://s3.eu-west-1.amazonaws.com/eu1.download.solidstatelogic.com/Harrison/Mixbus-${pkgver}-x86_64.run")
sha256sums=('cb6255b757f876477d60269ca3198097a36dfbac537f0e47b9c8f3c76c2acd78')

## Variables
_installer="Mixbus-${pkgver}-x86_64"
_app="Mixbus_x86_64-$pkgver"

package() {
	## Create Install Directories
	mkdir -p "$pkgdir/opt/$pkgname" "$pkgdir/usr/share/applications"
	## Extract Installer
	sh "$srcdir/`basename ${_installer}`.run" --tar xf
	## Extract Bundle
	tar -xvf "$srcdir/`basename ${_app}`.tar"
	## Remove LV2 Plugins Provided in Archlinux Repos
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/avldrums.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/b_synth.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/b_whirl.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/dpl.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/fat1.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/fil4.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/gmsynth.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/meters.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/midifilter.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/stereoroute.lv2"
	rm -r "$srcdir/`basename ${_app}`/lib/LV2/tuna.lv2"
	## Remove Uninstall Script
	rm -r "$srcdir/`basename ${_app}`/bin/Mixbus-${pkgver}.uninstall.sh"
	## Install Mixbus 32C
	cp -r "$srcdir/`basename ${_app}`/"* "$pkgdir/opt/$pkgname"
	## Install Desktop File
	echo "[Desktop Entry]" > "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Encoding=UTF-8" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Version=1.0" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Type=Application" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Terminal=false" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Exec=/opt/$pkgname/bin/$pkgname" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Name=Harrison Mixbus Version 9" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Icon=/opt/$pkgname/share/resources/Mixbus-icon_256px.png" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Comment=Digital Audio Workstation" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	echo "Categories=AudioVideo;AudioEditing;Audio;Recorder;" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
	## Change permissions of desktop file
	chmod 644 "$pkgdir/usr/share/applications/Harrison Mixbus Version 9.desktop"
}
