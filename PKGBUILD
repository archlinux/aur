# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>

pkgname=python-smbcrawler-git
pkgver=r20.3244a90
pkgrel=1
pkgdesc="Crawler for smb shares for the search of credentials."
arch=('any')
url="https://github.com/SySS-Research/smbcrawler"
license=('MIT')
depends=('python' 
         'impacket' 
         'python-libnmap' 
         'python-lxml' )
makedepends=('git' 'python-setuptools') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('python-smbcrawler::git+https://github.com/SySS-Research/smbcrawler.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py build	
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1
}
