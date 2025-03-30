# Maintainer: devome <evinedeng@hotmail.com>

pkgbase=nunicode
pkgname=(libnu libnusqlite3)
pkgver=1.11
pkgrel=2
url="https://bitbucket.org/alekseyt/${pkgbase}"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
license=('MIT')
makedepends=('cmake' 'git' 'sqlite3')
source=("${pkgbase}::git+${url}.git#tag=${pkgver}")
sha256sums=('bfc9fccea72b52bf98d3f5cae52c0763360a70c589333f441c97a9e722ae6abd')

build() {
    cmake -B build -S "${pkgbase}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build --target nu
    cmake --build build --target nusqlite3
}

package_libnu() {
    pkgdesc="fast, small and portable Unicode library"

    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgbase}/LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgbase}/README.md" "${pkgdir}/usr/share/${pkgname}/README.md"
}

package_libnusqlite3() {
    pkgdesc="nunicode sqlite extension"

    install -Dm755 build/sqlite3/libnusqlite3.so "${pkgdir}/usr/lib/libnusqlite3.so"
    install -Dm644 "${pkgbase}/LICENSE"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgbase}/README.md"        "${pkgdir}/usr/share/${pkgname}/README.md"
}
