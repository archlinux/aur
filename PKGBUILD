# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=ptt-fix
pkgver=0.8.1
pkgrel=1
pkgdesc="A somewhat hacky workaround for push-to-talk in Discord and other apps in Wayland."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/ptt-fix"
license=('MIT')
depends=(xdotool)
makedepends=('go>=2:1.25.0')
optdepends=()
provides=()
source=("https://github.com/DeedleFake/ptt-fix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7838d7bb7db37d5f03c63ad57cbdb37b197359612e4406f4945de844228f1b3f')

build() {
	cd "$pkgname-$pkgver"
	GOTOOLCHAIN=auto go build -v -trimpath -o ptt-fix .
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m u=rwx,g=srx,o=rx --group input ptt-fix "$pkgdir/usr/bin/ptt-fix"
  install -Dm0644 ptt-fix.service "$pkgdir/usr/lib/systemd/user/ptt-fix.service"
}

# vim: ts=2 sw=2 et
