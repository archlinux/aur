# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=fwtui
pkgver=0.0.5
pkgrel=1
pkgdesc="A TUI for managing UFW (Uncomplicated Firewall) rules"
arch=('x86_64')
url="https://github.com/Beny406/fwtui"
license=('unknown')
depends=()
makedepends=('go')
_tag="v0.0.5"
_srcdir="fwtui-0.0.5"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/Beny406/fwtui/tar.gz/refs/tags/$_tag")
sha256sums=('b8925246e872e24aadd956ea25118fd7ec538ec52794447b3e8e233efbb3795a')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=1 GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}
function package() {
	cd "$_srcdir"
	install -Dm755 "fwtui" "$pkgdir/usr/bin/$pkgname"
	if [ -f ../LICENSE ]; then
		install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
