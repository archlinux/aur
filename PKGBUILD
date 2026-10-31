# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=expose
pkgver=0.5.4
pkgrel=1
_repo=expose
_tag=v0.5.4
_srcdir="$_repo-$pkgver"
pkgdesc="A single-binary, zero-signup alternative to ngrok to expose localhost to the internet"
arch=('x86_64')
url="https://kernelshard.github.io/expose/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kernelshard/expose/archive/refs/tags/$_tag.tar.gz")
sha256sums=('579af3d2282537a621f82f6a0254904b99f3d21dba1fe360eac6570a8bdaefb8')

build() {
	cd "$_srcdir"
	go build -trimpath -buildmode=pie -ldflags "-buildid=" -o build/expose ./cmd/expose
}

package() {
	install -Dm755 "$srcdir/$_srcdir/build/expose" "$pkgdir/usr/bin/expose"
	install -Dm644 "$srcdir/$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
