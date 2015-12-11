# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=sidef
pkgver=2.12
pkgrel=1
pkgdesc="A modern object-oriented programming language."
url="https://github.com/trizen/${pkgname}"
arch=('any')
license=('GPLv3')

makedepends=('perl-module-build')

depends=('perl>=5.22.0' 'perl-data-dump')
optdepends=('perl-math-bigint-gmp: for faster numerical calculations')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('3764afa2b3edb68ce7f06e4e49e50f2c9cd9646a8be64690b71801def0e285b8')

package() {
    cd "$pkgname-$pkgver"
    perl Build.PL --destdir "$pkgdir" --installdirs vendor
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin

    cd "share/sidef"
    for i in *
    do
        install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
    done
}
