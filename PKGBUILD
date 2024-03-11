# Maintainer: Nixuge
# Previously gtkpickeradder-hook

pkgname=desktop-patcher-hook
pkgver=v1.0.0.r13.g24f35c2
pkgrel=1
pkgdesc='A pacman hook to make some apps behave nicer, including using the wayland ozone platform, the gtk file picker & zooming qt apps'
url=https://github.com/Nixuge/DesktopPatcher
arch=(any)
license=(WTFPL)
depends=('python')
source=("git+https://github.com/Nixuge/DesktopPatcher")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/DesktopPatcher"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/DesktopPatcher"
    
    # License
    install -Dm644 \
        "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Hook
    install -Dm644 \
        "desktop_patcher.hook" \
        "${pkgdir}/etc/pacman.d/hooks/desktop_patcher.hook"
    
    # Py file going w the hook
    install -Dm644 \
	     "desktop_patcher.py" \
	     "${pkgdir}/etc/pacman.d/hooks/desktop_patcher.py"
}
