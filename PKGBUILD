# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=lavalauncher-mao-git
pkgver=20250429.07717e7
pkgrel=1
pkgdesc='A simple launcher panel for Wayland'
arch=(x86_64)
url='https://github.com/DreamMaoMao/lavalauncher'
license=(GPL3)
depends=('cairo' 'wayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
provides=("${pkgname%-*}")
conflicts=(
    "lavalauncher"
    "lavalauncher-git"
)
source=("${pkgname%-*}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build()
{
    cd "${pkgname%-*}"
    meson \
        --prefix=/usr \
        --buildtype release \
        build
    ninja -C build
}

package()
{
    cd "${pkgname%-*}"
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
    install -D -m 0644 README.md "$pkgdir"/usr/share/doc/"${pkgname%-*}"/README.md  
}
