pkgname=pcloudcc-lneely
pkgver=20260311T214010Z
pkgrel=1
epoch=0
pkgdesc="pcloudcc-lneely is a simple linux console client for pCloud cloud storage, forked from github.com/pcloudcom/console-client and independently maintained."
arch=('x86_64' 'aarch64')
provides=("pcloudcc")
conflicts=("pcloudcc-git")
url="https://github.com/lneely/pcloudcc-lneely"
license=(BSD-3-Clause)
depends=(readline zlib fuse3 mbedtls sqlite boost)
makedepends=(udev)
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/lneely/pcloudcc-lneely/tar.gz/refs/tags/$pkgver"
        "pcloudcc@.service"
        "pcloud.env.sample"
        "pcloudcc-systemd.md")
sha256sums=('73a9cddb47f475c92c70a6a68ea0c5454519627287caeb75800a96a605da72ac'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "pcloudcc-lneely-$pkgver"
    make
}

package() {
    cd "pcloudcc-lneely-$pkgver"
    install -d $pkgdir/usr/bin
    install -m 755 pcloudcc $pkgdir/usr/bin/pcloudcc
    
    install -Dm644 "$srcdir/pcloudcc@.service" "$pkgdir/usr/lib/systemd/user/pcloudcc@.service"
    install -Dm644 "$srcdir/pcloud.env.sample" "$pkgdir/usr/share/doc/$pkgname/pcloud.env.sample"
    install -Dm644 "$srcdir/pcloudcc-systemd.md" "$pkgdir/usr/share/doc/$pkgname/pcloudcc-systemd.md"
}


