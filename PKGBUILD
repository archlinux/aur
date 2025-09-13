# caelestia-cli

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-cli-git'
pkgver=1.0.0.r0.g54f7611
pkgrel=1
pkgdesc='The main cli for the Caelestia dotfiles'
arch=('any')
url='https://github.com/caelestia-dots/cli'
license=('GPL-3.0-only')
depends=('python' 'python-pillow' 'python-materialyoucolor' 'libnotify' 'swappy' 'grim' 'dart-sass'
         'app2unit' 'wl-clipboard' 'slurp' 'gpu-screen-recorder' 'dconf' 'cliphist' 'fuzzel')
optdepends=('caelestia-shell: shell control and screenshot function')
makedepends=('git' 'python-build' 'python-installer' 'python-hatch' 'python-hatch-vcs')
provides=('caelestia-cli')
conflicts=('caelestia-cli')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ./completions/caelestia.fish "$pkgdir"/usr/share/fish/vendor_completions.d/caelestia.fish
}
