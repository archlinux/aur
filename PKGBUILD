# Maintainer: Thorsten Toepper <atsutane-aur at freethoughts dot de>

pkgname=sysctl-logger-git
pkgver=r56.700f749
pkgrel=1
pkgdesc='sysctl monitoring with BPF'
arch=('x86_64' 'aarch64')
url='https://github.com/shunghsiyu/sysctl-logger'
license=('GPL-2.0-only')
depends=('libbpf')
makedepends=('git' 'clang' 'bpf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('sysctl-logger::git+https://github.com/shunghsiyu/sysctl-logger.git')
sha256sums=('SKIP')


pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	make SBINDIR='/usr/bin'
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}/" SBINDIR='/usr/bin' install
}

