# Maintainer: Digital Artifex <7929434+DigitalArtifex@users.noreply.github.com>

pkgname="plasma6-wallpapers-komplex"
pkgver=1.0.8.1
pkgrel=1
pkgdesc="Use complex shader arrangements as a desktop background"
arch=('x86_64')
provides=("plasma6-wallpapers-komplex")
conflicts=("plasma6-wallpapers-komplex-bin")
url="https://github.com/DigitalArtifex/kde-komplex-wallpaper-engine"
license=('GPL-3.0-or-later')
depends=('glib2' 'glibc' 'plasma-desktop' 'qt6-base' 'pipewire' 'fftw' 'qt6-multimedia' 'qt6-multimedia-gstreamer' 'qt6-declarative' 'qt6-imageformats' 'qt6-quick3d' 'qt6-shadertools' 'unzip' 'qt6-webview' 'libpipewire' 'kirigami' 'gcc-libs' 'libplasma' 'kwindowsystem' 'plasma-workspace' 'python')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'libpipewire')
backup=('etc/profile')
install='komplex.install'
changelog='changelog'
source=("https://github.com/DigitalArtifex/kde-komplex-wallpaper-engine/archive/refs/tags/$pkgver.tar.gz")

build() {
	cd "kde-komplex-wallpaper-engine-$pkgver"
	cmake -S ./ -B ./build
	cmake --build ./build
}

package() {
	cd "kde-komplex-wallpaper-engine-$pkgver"
	cmake --install ./build --prefix $pkgdir/usr
	install -d "$pkgdir/usr/share/komplex/"
	cp -r data/* "$pkgdir/usr/share/komplex/"
	cp -r tools/ShaderToyProcessor.py "$pkgdir/usr/share/komplex/stc.py"
	chmod -R 755 "$pkgdir/usr/share/komplex/"
}
sha256sums=('d31fbcbaa2907098dbee7df325b83b123d25d63c47ced55d1a192b72d90bf79e')
