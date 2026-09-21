# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord-lite-git
pkgver=1.5.4
pkgrel=1
pkgdesc="Feature rich Discord TUI client. Lite version without media and call support."
arch=('any')
url="https://github.com/sparklost/endcord"
license=('LicenseRef-SparkLost')
provides=('endcord-lite')
conflicts=('endcord-lite')
depends=()
makedepends=('python>=3.12' 'uv' 'git' 'clang' 'patchelf' 'wget')
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland'
            'aspell: spellchecking'
            'yt-dlp: youtube support'
            'mpv: youtube in native player'
            'imagemagick: make notification images round')
source=("git+$url.git")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
  cd "endcord"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd endcord
	python build.py --clean-uv --level=LITE --nuitka --custom-python
}

package() {
	cd endcord
	install -Dm755 ./dist/endcord-lite "$pkgdir/usr/bin/endcord-lite"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/endcord-lite/README.md"
	install -Dm644 ./docs/commands.md "$pkgdir/usr/share/doc/endcord-lite/commands.md"
	install -Dm644 ./docs/configuration.md "$pkgdir/usr/share/doc/endcord-lite/configuration.md"
	install -Dm644 ./docs/extensions.md "$pkgdir/usr/share/doc/endcord-lite/extensions.md"
	install -Dm644 ./docs/keybindings.md "$pkgdir/usr/share/doc/endcord-lite/keybindings.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/endcord-lite/LICENSE"
	install -Dm644 ./tools/endcord.desktop "$pkgdir/usr/share/applications/endcord.desktop"
    install -Dm644 ./tools/icons/endcord.svg "$pkgdir/usr/share/icons/hicolor/256x256/apps/endcord.svg"
}
