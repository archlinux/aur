# Maintainer: spartanz51 <a.m@tuta.com>
#
# Prebuilt headless TutaBridge CLI/daemon: downloads the published x86_64
# binary from the GitHub release, no Rust build. The GUI is not packaged here.
# For a build-from-source VCS package, see tutabridge-git.

pkgname=tutabridge-bin
pkgver=0.1.0rc3
pkgrel=1
pkgdesc="Local IMAP/SMTP bridge for Tuta encrypted email (prebuilt headless CLI/daemon)"
arch=('x86_64')
url="https://github.com/spartanz51/tutabridge"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'dbus')
optdepends=('gnome-keyring: persist the Tuta session across reboots (Secret Service)'
            'kwallet: alternative Secret Service provider')
provides=('tutabridge')
conflicts=('tutabridge')
_tag=v0.1.0-rc.3
source=("tutabridge-$pkgver::$url/releases/download/$_tag/tutabridge-linux-x86_64"
        "tutabridge.service::https://raw.githubusercontent.com/spartanz51/tutabridge/$_tag/packaging/systemd/tutabridge.service"
        "LICENSE::https://raw.githubusercontent.com/spartanz51/tutabridge/$_tag/LICENSE")
sha256sums=('76c611051c66dff6ce8c5011b6d11b5a7d9aed2dc095c727340bea6a04203eb0'
            '9c398acf860036a8912a3f0686cfd6dc55cb714fc3ddbff68c21755777cd439f'
            '947215ddc328843b76022d5b77e1ca3b1152301778d33e24491e5064e92fc6cf')

package() {
	install -Dm755 "tutabridge-$pkgver" "$pkgdir/usr/bin/tutabridge"
	install -Dm644 "tutabridge.service" "$pkgdir/usr/lib/systemd/user/tutabridge.service"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
