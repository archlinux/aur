# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname=pulseaudio-central
pkgver=0
pkgrel=1
pkgdesc="Pseudo-system-wide PulseAudio service. PulseAudio does not run as root."
arch=(any)
license=('GPL')
depends=('pulseaudio')
install='.install'
source=('pulseaudio-central.socket'\
	'pulseaudio-central.service'\
	'default.pa'\
	'pulseaudio-central.socket.5')
sha512sums=('51c782c44cea072d0bc7adf2d685f82aa13d01a912b0fa864a32bd8cb4c90557b4537ccba1266ece8702edb225f914d9524157ca7b7510eace9e79e71a76b8dd'\
	'f2300a2ebd2b7f733b2bc9d1f6a96e26dd4054a7eacfa8724fa47847024e7cf75b92a489662228da44996e090ccfb6da304fa09ad3d9b116c0aa72fd556b7296'\
	'569f28d58f69e0ece03daa4aa5dff4bdd0c74887d585e2584458af6f046ffeb5bb63e69a7082afd0754800226fc263e4ae68efc6d516b1acc4d39224d368d131'\
	'b6d364394344303723520d42ef948d8b7efa1c855553d309adeda90590d01bea5df2af7c6d73af4211e4af54ea9fc2b70f2e540559736c299524d5f67b9dd336')

package() {
	install -D -m 644 -T /dev/stdin "$pkgdir/usr/lib/sysusers.d/pulseaudio-central.conf" <<EOF
u pulse - "system-wide PulseAudio" /var/lib/pulseaudio-central /usr/bin/nologin
g pulse-access -
EOF
	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system"\
		pulseaudio-central.socket pulseaudio-central.service
	install -D -m 644 -t "$pkgdir/usr/share/pulseaudio-central" default.pa
}
