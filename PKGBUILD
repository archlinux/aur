# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=sidef
pkgver=2.23
pkgrel=1
pkgdesc="A modern object-oriented programming language."
arch=('any')
url="https://github.com/trizen/${pkgname}"
license=('GPLv3')

makedepends=('perl-module-build')
depends=('perl>=5.22.0' 'perl-data-dump' 'perl-math-gmpq' 'perl-math-gmpz' 'perl-math-mpfr>=3.29' 'perl-math-mpc')

source=("https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b51636f0761522aba03827de04a5f34ad18185a7f46d63692781cf484c46232b')

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
