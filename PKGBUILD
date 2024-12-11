# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=dmtool
pkgver=1.0.1
pkgrel=1
pkgdesc="A library to manipulate D&D monsters "
arch=('x86_64')
url="https://vance.fish/git/dmtool"
license=('GPL-3.0-or-later')
depends=(confuse gcc-libs glibc)
makedepends=(nlohmann-json)
backup=(etc/dmtool.conf)
source=($url/snapshot/$pkgname-$pkgver.tar.gz{,.asc}
    'git+https://github.com/vitusventure/5thSRD.git')
validpgpkeys=('2FCF3A100A5B5C0E78E41BDB215A56B23729BC81') # Nathan Vance <natervance@gmail.com>

prepare() {
    mv 5thSRD/ "$pkgname-$pkgver/parser/"
}

build() {
    cd "$pkgname-$pkgver"
    make parsed
    make
}

package() {
    cd "$pkgname-$pkgver"
    # Create /etc in install dir
    install -d "$pkgdir/etc"
    make DESTDIR="$pkgdir/" install
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('902518e53291b4aee3ba8bdb3b5b3f5ffe44c4a474c37429530e0f0c65c04aed'
            'SKIP'
            'SKIP')
