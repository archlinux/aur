# Maintainer: ludvig2457 <ludvig2457@archlinux.org>
# Contributor: SuperLauncher Team

pkgname=superlauncher
pkgver=2.0.0
pkgrel=1
pkgdesc="Minecraft launcher with mod support and server management"
arch=('any')
url="https://aur.archlinux.org/packages/superlauncher"
license=('custom:MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'python-packaging'
    'python-pillow'
    'python-tqdm'
)
optdepends=(
    'python-pypresence: Discord Rich Presence'
    'python-cryptography: encrypted storage'
    'python-psutil: system resource monitoring'
    'python-minecraft-launcher-lib: Minecraft version management'
    'python-pyjwt: JWT authentication'
    'jdk17-openjdk: run Minecraft Java Edition'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('7dc179e6ea9c854071a2f3e292338a5f47cf98f7f5fb427f2b74f4e4d69186c8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 superlauncher.desktop \
        "$pkgdir/usr/share/applications/superlauncher.desktop"

    if [ -f assets/icon.png ]; then
        install -Dm644 assets/icon.png \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/superlauncher.png"
    fi
}
