# Maintainer: Aditya Mehra <aix.m@outlook.com>
# Prebuilt from the GitHub release: the driver is built in Valve's Steam Runtime SDK so it loads inside SteamVR's
# container on any distribution, which a build with the host's toolchain would not guarantee.
pkgname=riftlinux-bin
_pkgname=riftlinux
pkgver=0.1.6
pkgrel=1
pkgdesc="Oculus Rift CV1 driver for Linux (SteamVR and OpenXR): tracking, Touch, Auto-HDR, motion smoothing"
arch=('x86_64')
url="https://github.com/AIIX/RiftLinux"
license=('BSL-1.0' 'MPL-2.0' 'BSD-3-Clause' 'IJG' 'Zlib')
depends=('python' 'usbutils' 'rtkit' 'glibc' 'systemd-libs' 'libusb' 'dbus' 'vulkan-icd-loader' 'libdrm' 'libx11'
	'libxcb' 'wayland' 'sdl2' 'libglvnd' 'hicolor-icon-theme')
optdepends=('steam: SteamVR runs the driver'
	'libnotify: notifications from the RiftLinux Runtime app entry')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=riftlinux.install
options=('!strip' '!debug')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('1bdf64961b6e72d8102910731093bc91cbf2ca5bf6f5c420a90af7ef6c8d259f')

package() {
	# Not cp -a: the extracted files belong to the building user, the package's must belong to root.
	cp -dR --preserve=mode,timestamps "$srcdir/$_pkgname-$pkgver-$CARCH/root/." "$pkgdir/"
	# The release carries every licence text in /usr/share/licenses/riftlinux (RiftLinux and the libraries linked in).
	ln -s "$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
