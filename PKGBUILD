# Maintainer: Michael Serajnik <m at mser dot at>
pkgname=cproton-git
_pkgname=ProtonUpdater
pkgver=0.2.1.r2.g0805f86
pkgrel=2
pkgdesc="Script to make it easier to update Proton GE to the latest version"
arch=('any')
url="https://github.com/flubberding/ProtonUpdater"
license=('MIT')
source=("git+https://github.com/flubberding/ProtonUpdater.git"
        "ignore_sha512sum.patch")
sha512sums=('SKIP'
            'dafa6a908e191f118c8081b3a432d1dd0696281953653eb5ee5e7f655d2eb770910979a3be22bff0d0f5218ffc3691740945a60a85addd289250088a6024b0c5')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git apply < ../ignore_sha512sum.patch || true
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/$_pkgname/cproton.sh" "$pkgdir/usr/bin/cproton"
}
