# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=dymon-git
pkgver=r74.11df3fd
pkgrel=1
pkgdesc='Command line based print tool for DYMO LabelWriter Wireless'
arch=('x86_64')
url='https://github.com/minlux/dymon'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake')
provides=('txt2pbm' 'dymon_pbm' 'dymon_srv')
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${srcdir}/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    install -Dm755 build/txt2pbm "${pkgdir}/usr/bin/txt2pbm"
    install -Dm755 build/dymon_pbm "${pkgdir}/usr/bin/dymon_pbm"
    install -Dm755 build/dymon_srv "${pkgdir}/usr/bin/dymon_srv"
    install -Dm644 "${srcdir}/dymon/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
