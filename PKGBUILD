# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=ax-shell
pkgver=r130.fcf3323
pkgrel=1
pkgdesc="A feature-rich, configurable, and elegant shell for Linux systems."
arch=('x86_64')
url="https://github.com/Axenide/${pkgname}"
license=('unknown') # No license file found in repo
depends=(
    'brightnessctl'
    'cava'
    'cliphist'
    'fabric-cli-git'
    'gnome-bluetooth-3.0'
    'gobject-introspection'
    'gpu-screen-recorder'
    'gray-git'
    'hypridle'
    'hyprlock'
    'hyprpicker'
    'hyprshot'
    'hyprsunset'
    'imagemagick'
    'libnotify'
    'matugen-bin'
    'noto-fonts-emoji'
    'nvtop'
    'playerctl'
    'python-fabric-git'
    'python-gobject'
    'python-ijson'
    'python-numpy'
    'python-pillow'
    'python-psutil'
    'python-pywayland'
    'python-requests'
    'python-setproctitle'
    'python-toml'
    'python-watchdog'
    'swappy'
    'swww-git'
    'tesseract'
    'tmux'
    'ttf-nerd-fonts-symbols-mono'
    'upower'
    'uwsm'
    'vte3'
    'webp-pixbuf-loader'
    'wl-clipboard'
)
makedepends=('git' 'unzip')
source=("${pkgname}::git+https://github.com/Axenide/${pkgname}.git"
        "zed-sans-1.2.0.zip::https://github.com/zed-industries/zed-fonts/releases/download/1.2.0/zed-sans-1.2.0.zip")
sha256sums=('SKIP'
            '909c5b2e6e16c2733a416a5ebb16b47c6b54130f146f33306d1567d1f5611815')
options=()

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
}

package() {
	install -d "$pkgdir/usr/share/$pkgname"
	cp -r "$srcdir/$pkgname/"{assets,config,main.py,README.md} "$pkgdir/usr/share/$pkgname/"

	install -d "$pkgdir/usr/bin"
	ln -s "../share/$pkgname/main.py" "$pkgdir/usr/bin/$pkgname"

	install -d "$pkgdir/usr/share/fonts/zed-sans"
	unzip -o "$srcdir/zed-sans-1.2.0.zip" -d "$pkgdir/usr/share/fonts/zed-sans/"
	install -d "$pkgdir/usr/share/fonts/tabler-icons"
	cp -r "$srcdir/$pkgname/assets/fonts/"* "$pkgdir/usr/share/fonts/tabler-icons/"
} 
