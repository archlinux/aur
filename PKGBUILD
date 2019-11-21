# Maintainer: Jonas Krogh Hansen "Badgy" <jonaskhansen@gmail.com>
# Contributor: Falke Carlsen "cogitantium" <falke.cs@gmail.com>
pkgname=spotirec
pkgver=r80.c082a01
pkgrel=1
pkgdesc="Create playlist of recommended tracks on Spotify"
arch=('any')
url="https://github.com/Badgie/spotirec"
license=('GPL3')
depends=('python>=3.8.0'
        'python-bottle>=0.12.17'
        'python-requests>=2.22.0')
makedepends=('git')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}::git+https://github.com/Badgie/spotirec")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    mkdir -p "$pkgdir/usr/lib/spotirec"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$HOME/.config/spotirec"

    install spotirec.py oauth2.py recommendation.py -t "$pkgdir/usr/lib/spotirec"

    ln -s "/usr/lib/spotirec/spotirec.py" "$pkgdir/usr/bin/spotirec"
}