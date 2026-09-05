# Maintainer: frakod <frakod@pm.me>

pkgname='smooth-scroll-linux-kde-effect-git'
pkgver=r89.0eecec4
pkgrel=1

pkgdesc='This KWin effect adds KDE Plasma integration for Smooth Scroll Linux. Use it when the Smooth Scroll daemon is already installed and running, and you want session-aware behavior in KDE Plasma.'
arch=(x86_64 aarch64)
url='https://github.com/Wayne6530/smooth-scroll-linux'
license=('MIT')

depends=(smooth-scroll-linux-git qt6-base qt6-declarative kcoreaddons kconfig kwindowsystem libdrm kwin)
makedepends=(cmake extra-cmake-modules vulkan-headers)
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver()
{
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$srcdir/$pkgname/extensions/kde"
    cmake -B build
    cmake --build build --config Release
}

package()
{
    cd "$srcdir/$pkgname/extensions/kde"
    DESTDIR="$pkgdir" cmake --install build
}
