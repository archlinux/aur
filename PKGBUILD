# Maintainer: Jim Turner <jturner314 @t gmail dot com>

pkgname=thinkpad-scripts
pkgver=4.4.0
pkgrel=1
pkgdesc="Scripts for ThinkPad X220 & X230 Tablet rotation, docking, etc."
arch=('any')
url="http://martin-ueding.de/en/projects/think-rotate"
license=('GPL')
depends=('acpid' 'alsa-utils' 'python' 'python-setuptools' 'systemd>=196'
         'xf86-input-wacom' 'xorg-xinput' 'xorg-xrandr')
makedepends=('python-sphinx')
optdepends=('glib2: for rotating subpixel anti-aliasing'
            'kvkbd: for virtual keyboard'
            'libpulse: for volume control when docking'
            'networkmanager: for managing connections when docking'
            'xorg-xbacklight: for backlight control when docking')
conflicts=('think-rotate')
install="$pkgname.install"
source=("https://github.com/martin-ueding/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2a657dd32cbfd18d565e4a7b7626b879217cbadd6c6b292d44231c58f4815ef1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    python setup.py install --single-version-externally-managed --root="$pkgdir"
    mv "$pkgdir/lib/udev" "$pkgdir/usr/lib/"
    rmdir "$pkgdir/lib"
}
