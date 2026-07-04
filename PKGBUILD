# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hugo Doria <hugodoria@gmail.com>
# Contributor: priyank <priyankmg@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obmenu
pkgver=1.2.0
pkgrel=1
pkgdesc='Openbox menu editor.'
arch=('any')
url='https://github.com/keithbowes/obmenu/'
license=('GPL')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'openbox')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keithbowes/obmenu/archive/refs/tags/$pkgver.tar.gz"
       "https://raw.githubusercontent.com/keithbowes/obmenu/refs/heads/master/icons/mnu48.png")
md5sums=('988df62c0840adc29f707ea04112460e'
         '2d66bc2eb13419cc76acd3d2fb78e079')
build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    mv icons/mnu48.png icons/$pkgname.png
    install -D "icons/$pkgname.png" "$pkgdir/usr/share/icons/$pkgname.png"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$pkgname.desktop <<EOF
[Desktop Entry]
Name=obmenu
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Comment= A menu editor for Openbox and Openbox clones
EOF
}
