# Maintainer: Jonas Krogh Hansen "Badgy" <jonaskhansen@gmail.com>
_pkgname=spotirec
pkgname=${_pkgname}-git
pkgver=r24.781b07c
pkgrel=1
pkgdesc="Create playlist of recommended tracks on Spotify"
arch=('any')
url="https://github.com/Badgie/spotirec"
depends=('python>=3.7.4'
        'python-pip>=19.2.3'
        'python-bottle>=0.12.17'
        'python-requests>=2.22.0'
        'python-spotipy>=2.4.4')
makedepends=('git')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}::git+https://github.com/Badgie/spotirec")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    mkdir -p "$pkgdir/usr/lib/spotirec"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$HOME/.config/spotirec"

    install spotirec.py -t "$pkgdir/usr/lib/spotirec"

    ln -s "/usr/lib/spotirec/spotirec.py" "$pkgdir/usr/bin/spotirec"

    touch "$HOME/.config/spotirec/blacklist"
}