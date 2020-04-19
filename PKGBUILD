# Maintainer: Jonas Krogh Hansen "Badgy" <jonaskhansen at gmail dot com>
# Contributor: Falke Carlsen "cogitantium" <falke dot cs at gmail dot com>
_pkgname=spotirec
pkgname=${_pkgname}-git
pkgver=r206.30b9654
pkgrel=1
pkgdesc="Create playlist of recommended tracks on Spotify"
arch=('any')
url="https://github.com/Badgie/spotirec"
license=('GPL3')
replaces=('spotirec')
depends=('python>=3.8.0'
        'python-bottle>=0.12.17'
        'python-requests>=2.22.0'
        'python-pillow>=6.2.0')
makedepends=('git')
provides=("${_pkgname}")
source=("git+https://github.com/Badgie/spotirec")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$HOME/.config/spotirec"

    python test.py

    install tuning-opts -t "$HOME/.config/spotirec"

    python3 setup.py install --root="${pkgdir}" --prefix=/usr
}
