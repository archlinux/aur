pkgname=snotify-git
pkgver=r7.b225dce
pkgrel=1
pkgdesc="Play sounds when reciving a notification."
arch=("any")
url="https://github.com/Kimiblock/snotify"
license=("GPL2")
depends=()
makedepends=('go')
conflicts=('snotify')
backup=()
source=("git+https://github.com/Kimiblock/snotify.git")
sha256sums=('SKIP')

function pkgver(){
	cd "${srcdir}/snotify"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
	cd "${srcdir}/snotify"
	go build -trimpath -mod=readonly -modcacherw
}
package() {
	install -Dm755 "${srcdir}/snotify/snotify" "${pkgdir}/usr/bin/snotify"
	install -Dm644 "${srcdir}/snotify/snotify.service" "${pkgdir}/usr/lib/systemd/user/snotify.service"
}
