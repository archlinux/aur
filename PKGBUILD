# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: cdhotfire <cdhotfire@gmail.com>

pkgname=rawstudio
pkgver=2.0.r589
_commit=003dd4f33377dcfd15ae32904a7cbb0e92123607
pkgrel=3
pkgdesc='An open source raw-image converter written in GTK+'
arch=('x86_64')
url='https://rawstudio.org'
license=('GPL2')
depends=('osm-gps-map' 'desktop-file-utils' 'libgphoto2' 'fftw' 'gconf' 'lcms2' 'exiv2' 'lensfun')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$_commit.tar.gz")
sha256sums=('9e20399503a302e040319fbc877b614afce491891f5563fdb2725b1877eb3aab')

build() {
    cd "$pkgname-$_commit"
    ./autogen.sh
    ./configure --prefix=/usr --disable-static
    make CXXFLAGS="-Wno-narrowing"
}

package() {
    cd "$pkgname-$_commit"
    make prefix="$pkgdir/usr" install
}
