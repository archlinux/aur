# caelestia-cli

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-cli-git'
pkgver=r196.0ccf16d
pkgrel=1
pkgdesc='The main cli for the Caelestia dotfiles'
arch=('any')
url='https://github.com/caelestia-dots/cli'
license=('GPL-3.0-only')
depends=('python' 'python-pillow' 'python-materialyoucolor' 'libnotify' 'wayfreeze' 'swappy' 'grim' 'dart-sass' 'app2unit' 'wl-clipboard' 'slurp' 'wl-screenrec' 'glib2' 'libpulse' 'cliphist' 'fuzzel')
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
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "$pkgdir"/usr/share/fish/vendor_completions.d
    install -m 0644 ./completions/caelestia.fish "$pkgdir"/usr/share/fish/vendor_completions.d/caelestia.fish
}
