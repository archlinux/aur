# Maintainer: Jim Turner <jturner314 @t gmail dot com>

pkgname=thinkpad-scripts
pkgver=4.7.0
pkgrel=1
pkgdesc="Scripts for ThinkPad X220 & X230 Tablet rotation, docking, etc."
arch=('any')
url="http://martin-ueding.de/en/projects/thinkpad-scripts"
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
sha256sums=('2d2fb85e8b2ae6f1ee6f9e16d3e07d429eb661f66f028d858eb9f4e5d3b87d1b')

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
