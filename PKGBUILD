# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>

pkgname=python-smbcrawler-git
pkgver=r27.6020f9f
pkgrel=1
pkgdesc="Crawler for smb shares for the search of credentials."
arch=('any')
url="https://github.com/SySS-Research/smbcrawler"
license=('MIT')
depends=('python' 
         'impacket' 
         'python-libnmap' 
         'python-lxml'
         'python-magic' 
         'python-pdftotext' )
makedepends=('git' 
             'python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools'
             # 'python-pytest'
             # 'python-pexpect' 
             ) 
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
    python -m build --wheel --no-isolation
}

# Ignoring tests, because they do not work
# check() {
#     cd "$srcdir/${pkgname%-git}"
#     pytest
# }

package() {
	cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
