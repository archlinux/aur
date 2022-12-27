# Maintainer: Götz <me@local>
# Contributor: Francisco Lopes <francisco@oblita.com>
pkgname=interception-caps2esc-delay-git
_realname=interception-caps2esc
pkgver=0.1.3.r5.g3f9a39c
pkgrel=1
pkgdesc='caps2esc: transforming the most useless key ever in the most useful one - with delay patches'
arch=(x86_64)
license=(MIT)
url="https://gitlab.com/mar04/caps2esc/"
depends=(interception-tools)
conflicts=(caps2esc interception-caps2esc)
replaces=(interception-caps2esc)
install=$pkgname.install
source=("$pkgname::git+https://gitlab.com/mar04/caps2esc/"
        "udevmon.yaml")
md5sums=(SKIP
         44890a5f6c419c5eb6730636f3a6b535)

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$pkgname
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd $srcdir/$pkgname/build
    make DESTDIR="$pkgdir/" install
    install -D -m0644 $srcdir/udevmon.yaml "$pkgdir/usr/share/doc/$_realname/udevmon.example.yaml"
}
