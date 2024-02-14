# Maintainer: Elppans
pkgname=qemu-android-cm-x86
_pkgver="14.1-r5"
pkgver=14.1.r5
pkgrel=3
pkgdesc="Android-x86 environment via QEMU and VirGL"
arch=("x86_64")
url="http://www.android-x86.org/"
license=('Apache' 'GPL2' 'custom:Creative Commons 3.0 Attribution Unported')
depends=('rxvt-unicode' 'zenity' 'qemu' 'qemu-ui-sdl' 'hicolor-icon-theme')
makedepends=('inkscape')
conflicts=('qemu-android-x86' 'qemu-android-oreo-x86')
install="qemu-android-cm-x86.install"
source=("https://archive.org/download/sjarb_cm14.1r5/cm-x86-${_pkgver}.${arch}.rpm"
		"https://upload.wikimedia.org/wikipedia/commons/d/d7/Android_robot.svg"
		"qemu-android"
		"config"
		"qemu-android.desktop")
sha256sums=('d401cea325a49c9fb17c7b999cbdc1c4cba3ee6109689868663d42fb6fb5c4a4'
            '8c80b881727efc8831c8ef53806e7c1d0427607e145aae09061c4870b6cd402f'
            '5e7d8eedffb7b21f0f61b6f2b60e534d7d89c638409f2889d3ee58f6b9368267'
            'e9524cdb27c57e6650af763b2231d67ff3e2beb12f52133e7e95eda4f16b0881'
            '8a5ed6a6c1a4dfd1c8af0ff5de48965ec2dc6b50f87e5f990d33c7025f63c8ec')

#PKGEXT=".pkg.tar"

package() {

	mkdir -p $pkgdir/usr/share/android-x86 $pkgdir/usr/bin $pkgdir/usr/share/applications
	install -m0644 $srcdir/cm-x86-${_pkgver}/* $pkgdir/usr/share/android-x86
	install -m0644 $srcdir/usr/bin/qemu-android $pkgdir/usr/share/android-x86/original.qemu-android
	install -m0644 $srcdir/config $pkgdir/usr/share/android-x86
	install -m0644 $srcdir/qemu-android.desktop $pkgdir/usr/share/applications
	install -m0755 $srcdir/qemu-android $pkgdir/usr/bin/qemu-android

	iconsizes=(16 32 64 128 256 512)
	for size in "${iconsizes[@]}"; do
		mkdir -p $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps
		inkscape -o $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/qemu-android.png -w $size -h $size $srcdir/Android_robot.svg
	done

}
