pkgname=hackernel
pkgver=1.7.4
pkgrel=2
pkgdesc="host intrusion detection and prevention system"
url="https://github.com/lanthora/hackernel"
license=('GPL')
arch=('x86_64' 'armv7h' 'aarch64')
source=(https://github.com/lanthora/hackernel/archive/refs/tags/v$pkgver.tar.gz
        https://patch-diff.githubusercontent.com/raw/lanthora/hackernel/pull/91.diff)

sha256sums=('6ff0a8098629fb75fa253c3657f7586a529727401b98053b329c14f31a715abd'
            'b61bf7487f9ab00bcd96fc060caa2d825dea1e637724f19ac7a9dce41ed802e2')

depends=('dkms' 'libnl')
makedepends=('cmake' 'make' 'go' 'nlohmann-json')
backup=('etc/hackernel/telegram.yaml' 'etc/hackernel/web.yaml')

build() {
        cd "$pkgname-$pkgver"
        patch -Np1 < ../91.diff
        make arch-build
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" arch-install
}
