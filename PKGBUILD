# Maintainer: shorin <2433516202@qq.com>
pkgname=wl-longshot-git
pkgver=r17.82a497a
pkgrel=1
pkgdesc="A scrolling screenshot tool (long screenshot tool) for Wayland Compositors"
arch=('any')
url="https://github.com/SHORiN-KiWATA/wl-longshot"
license=('GPL3') 

depends=(
    'bash' 'grim' 'slurp' 'wl-clipboard' 
    'python' 'python-opencv' 'python-numpy'
    'gtk3' 'gtk-layer-shell' 'python-gobject' 'python-cairo'
)
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
    
    # 安装主程序
    install -Dm755 src/wl-longshot "$pkgdir/usr/bin/wl-longshot"
    
    # 安装所有 Python 组件到 /usr/share/wl-longshot
    install -Dm755 src/stitcher.py "$pkgdir/usr/share/wl-longshot/stitcher.py"
    install -Dm755 src/drawbox.py "$pkgdir/usr/share/wl-longshot/drawbox.py"
    
    # 安装证书
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
