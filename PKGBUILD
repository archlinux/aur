# Maintainer: Justus Piater <Justus-dev at Piater dot name>
pkgname=('syncevolution')
pkgver=2.0.0
pkgrel=1
pkgdesc="Synchronize PIM data via various protocols"
arch=('x86_64' 'aarch64')
url="https://syncevolution.org/"
license=('LGPL')
depends=('evolution-data-server' 'libgnome-keyring' 'neon' 'python' 'python-pygments')
makedepends=('intltool' 'boost')
source=("https://downloads.syncevolution.org/syncevolution/sources/syncevolution-2.0.0.tar.gz")

sha256sums=('2c5912e6b9a5064710deb8bf059e5058eae26114f6065de79be586ac4c89513e')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr                        \
                --libexecdir=/usr/lib/syncevolution  \
                --sysconfdir=/etc                    \
                --enable-core                        \
                --enable-dbus-service                \
                --enable-notify                      \
                --enable-notify-compatibility        \
                --enable-gui                         \
                --enable-pbap                        \
                --enable-dav
    make
}

package_syncevolution() {
    cd "$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm -df "$pkgdir/usr/bin/syncevo-http-server" \
           "$pkgdir/usr/lib/syncevolution/test"
}
