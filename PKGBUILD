# caelestia-cli

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-cli'
pkgver=1.0.4
pkgrel=1
pkgdesc='The main cli for the Caelestia dotfiles'
arch=('any')
url='https://github.com/caelestia-dots/cli'
license=('GPL-3.0-only')
depends=('python' 'python-pillow' 'python-materialyoucolor' 'libnotify' 'swappy' 'grim' 'dart-sass'
         'app2unit' 'wl-clipboard' 'slurp' 'gpu-screen-recorder' 'dconf' 'cliphist' 'fuzzel')
optdepends=('caelestia-shell: shell control and screenshot function')
makedepends=('python-build' 'python-installer' 'python-hatch' 'python-hatch-vcs')
provides=('caelestia-cli')
conflicts=('caelestia-cli-git')
_archive="caelestia-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('956b73150c3fc668cba02cda3b78067c952d67961a30eee2a2804c6962aff432')

build() {
    cd "${srcdir}/${_archive}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_archive}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ./completions/caelestia.fish "$pkgdir"/usr/share/fish/vendor_completions.d/caelestia.fish
}
