# Maintainer: Savely Krasovsky <savely@krasovs.ky>
pkgname=reform-tools
pkgver=1.7
pkgrel=0
pkgdesc="MNT Reform laptop tools"
arch=('x86_64' 'aarch64')
url="https://mntre.com/reform2/handbook/index.html"
license=('GPL3')
depends=('python'
         'python-psutil'
         'rsync'
         'alsa-utils'
         'systemd'
         'procps-ng'
         'busybox')
makedepends=('git')
optdepends=('ircii'
            'pavucontrol')
source=("$pkgname-$pkgver.tar.gz::https://source.mnt.re/reform/reform-tools/-/archive/2e0cff9b45d45237822a1d27e40dfd74af9476d0/reform-tools-2e0cff9b45d45237822a1d27e40dfd74af9476d0.tar.gz"
        'motd')
sha256sums=('edfb6e261a4174b983bb27a1dab370e96800a6b545b1225c5715bef960305a05'
            '30f643cbe65b0cdfca24326c68bce1a4e8a66c39aad3a81deec1c9532f7e4914')

prepare() {
	cd reform-tools-2e0cff9b45d45237822a1d27e40dfd74af9476d0

	mv Iosevka-Term /usr/share/fonts

	mv audio/99-reform.rules /lib/udev/rules.d
	mv audio/analog-input-reform.conf /usr/share/pulseaudio/alsa-mixer/paths
	mv audio/asound.state /var/lib/alsa
	mv audio/reform.conf /usr/share/pulseaudio/alsa-mixer/profile-sets
	rm -r audio/

	mv bin/* /usr/bin
	rm -r bin

	mv etc/* /etc
	rm -r etc

	mv sbin/* /usr/sbin
	rm -r sbin

	mv systemd/reform-poweroff /lib/systemd/system-shutdown
	mv systemd/reform-sleep.conf /usr/lib/systemd/sleep.conf.d
	rm -r systemd

	cd ..
	rm -r reform-tools-2e0cff9b45d45237822a1d27e40dfd74af9476d0
}

package() {
	cp -dr --no-preserve=ownership . $pkgdir/
	install -Dm644 "$srcdir"/motd -t "$pkgdir"/etc
}
