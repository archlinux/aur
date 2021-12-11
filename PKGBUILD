# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=qwertone
pkgver=0.4.0
_commit=24bcfb08f332eb1b88b599194a20665b25650091
pkgrel=1
pkgdesc='Simple music synthesizer app based on usual qwerty-keyboard for input'
arch=(x86_64)
url=https://gitlab.com/azymohliad/qwertone
license=(GPL3)
depends=(gtk3 alsa-lib)
makedepends=(git rust)
source=("git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	cd "$pkgname"
	cargo build --release --locked
}

_appid="com.gitlab.azymohliad.Qwertone"

package() {
	cd "$pkgname"
	install -Dm755 target/release/qwertone -t "$pkgdir/usr/bin"
	install -Dm644 "res/$_appid.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "res/$_appid.appdata.xml" -t "$pkgdir/usr/share/metainfo"
	install -Dm644 "res/icons/$_appid.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dm644 "res/icons/$_appid-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
}
