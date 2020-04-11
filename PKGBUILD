# Maintainer: Jason Nader <jason d0t nader pr0t0nmail.c0m>

pkgname=lavalauncher-git
pkgver=20200410.24d7050
pkgrel=1
pkgdesc='A simple launcher panel for Wayland'
arch=(x86_64)
url='https://git.sr.ht/~leon_plickat/lavalauncher'
license=(GPL3)
depends=('cairo' 'wayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
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
