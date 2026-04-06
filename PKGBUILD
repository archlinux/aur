# Maintainer: shorin <2433516202@qq.com>
pkgname=wl-longshot-git
pkgver=r12.7718502
pkgrel=2
pkgdesc="A scrolling screenshot tool (long screenshot tool) for Wayland Compositors"
arch=('any')
url="https://github.com/YourName/wl-longshot"
license=('GPL3') 
depends=('bash' 'grim' 'slurp' 'wl-clipboard' 'python' 'python-opencv' 'python-numpy')
optdepends=(
    'wl-screenrec: Fast stream recording backend (Recommended)'
    'wf-recorder: Stream recording backend (Fallback)'
    'fuzzel: Lightweight Wayland native menu UI'
    'satty: Post-capture editing'
    'xdg-utils: For opening images in default viewer'
)
provides=('wl-longshot')
conflicts=('wl-longshot')
source=("git+https://github.com/SHORiN-KiWATA/wl-longshot.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wl-longshot"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/wl-longshot"
    install -Dm755 src/wl-longshot "$pkgdir/usr/bin/wl-longshot"
    install -Dm755 src/stitcher.py "$pkgdir/usr/share/wl-longshot/stitcher.py"
    
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
