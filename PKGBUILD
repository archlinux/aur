# Maintainer: robertfoster

pkgname=friture-git
pkgver=v0.41.r0.g91029ce
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('python-appdirs' 'python-docutils' 'python-multipledispatch' 'python-numpy' 'python-opengl' 'python-pa-ringbuffer' 'python-pyqt5' 'python-pyrr' 'python-rtmixer' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'git')
conflicts=('friture')
source=("friture::git+https://github.com/tlecomte/friture.git")

build() {
    cd friture
    python setup.py build
}

package() {
    cd friture
    python setup.py install --root="$pkgdir/"
    install -Dm644 resources/images/friture.iconset/icon_512x512.png $pkgdir/usr/share/pixmaps/${pkgname%%-git}.png
    install -Dm644 appimage/${pkgname%%-git}.desktop "$pkgdir"/usr/share/applications/${pkgname%%-git}.desktop
    sed -i "s|usr|/usr|g" "$pkgdir"/usr/share/applications/${pkgname%%-git}.desktop
    
}

pkgver() {
    cd friture
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP')
