# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=ptt-fix
pkgver=0.7.4
pkgrel=1
pkgdesc="A somewhat hacky workaround for push-to-talk in Discord and other apps in Wayland."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/ptt-fix"
license=('MIT')
depends=(xdotool)
makedepends=('go>=2:1.22.0')
optdepends=()
provides=()
source=("https://github.com/DeedleFake/ptt-fix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd9e3ab7c2d82d0da1957ac18e12bfeffeeb902e432a322a1fc6def765befe8e')

build() {
	cd "$pkgname-$pkgver"
	go build -v -trimpath -o ptt-fix .
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m u=rwx,g=srx,o=rx --group input ptt-fix "$pkgdir/usr/bin/ptt-fix"
  install -Dm0644 ptt-fix.service "$pkgdir/usr/lib/systemd/user/ptt-fix.service"
}

# vim: ts=2 sw=2 et
