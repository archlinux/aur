pkgname=i3expo-ng-git
pkgver=r85.b55a74b
pkgrel=2
epoch=0
pkgdesc="Exposè for i3 WM"
arch=('any')
url="https://github.com/morrolinux/i3expo-ng"
license=("MIT")
provides=("i3expo" "i3expo-daemon")
depends=("python" "python-pygame" "python-i3ipc" "python-pillow" "python-pyxdg" "libxdmcp" "libxau" "libxcb" "libx11" "xorg-xrandr")
makedepends=("git" "python-pip" "make")
source=("${pkgname}::git+https://github.com/morrolinux/i3expo-ng.git")
md5sums=("SKIP")
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$pkgname"
    python setup.py build
}
package() { 
    cd "$pkgname"
    install -Dm 0644 defaultconfig  "${pkgdir}/usr/share/doc/i3expod/defaultconfig"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
