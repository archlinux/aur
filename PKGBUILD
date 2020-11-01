# Maintainer: hexchain <i at hexchain dot org>

pkgbase=pipewire-dropin
pkgname=("pipewire-pulse-dropin" "pipewire-jack-dropin")
pkgver=2
pkgrel=1
pkgdesc="Use pipewire as drop-in replacement for PulseAudio/JACK"
license=("LGPL2.1")
arch=(any)
source=(pipewire-pulse.conf pipewire-jack.conf override-pipewire-socket.conf pipewire-dropin.install)
install=pipewire-dropin.install

package_pipewire-pulse-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for PulseAudio"
    provides=(libpulse{,-simple,-mainloop-glib}.so)
    depends=("pipewire-pulse")

    install -Dm644 "$srcdir/pipewire-pulse.conf" -t "$pkgdir/etc/ld.so.conf.d"
    install -Dm644 "$srcdir/override-pipewire-socket.conf" "$pkgdir/usr/lib/systemd/user/pipewire.socket.d/listen-pulse.conf"
    install -dm755 "$pkgdir/etc/systemd/user"
    ln -sf /dev/null "$pkgdir/etc/systemd/user/pulseaudio.service"
    ln -sf /dev/null "$pkgdir/etc/systemd/user/pulseaudio.socket"
}


package_pipewire-jack-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for JACK"
    provides=(libjack{,net,server}.so)
    depends=("pipewire-jack")

    install -Dm644 "$srcdir/pipewire-jack.conf" -t "$pkgdir/etc/ld.so.conf.d"
}
sha256sums=('750c8f53b47b39a7bb8bdb62b1f35d749391a6735e4ed88083abb7d2e77a2fcf'
            'a3e7f6fb87019c1651243bd488e962a49c8e2e6916052c625a85e9a3e9762b8f'
            '3761246166d7b647d199f38e9c0e35e3b2df303a21fe2124b33be4f852a0071c'
            '1da4554e2c39c78aa4f8bd318b7ef3ff83979034be0b509891894f99bc7ecead')
