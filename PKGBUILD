# Creator: Ahmed Aboul-Ela
# Maintainer: Jack R <rubacha.jack03@gmail.com>
pkgname=sublist3r-git
pkgver=r138.729d649
pkgrel=5
pkgdesc="A python tool designed to enumerate subdomains of websites using OSINT."
arch=('any')
url="https://github.com/aboul3la/Sublist3r"
license=('GPL2')
depends=('python-requests' 'python-dnspython')
makedepends=('git')
conflicts=('sublist3r')
provides=('sublist3r')
source=('git+https://github.com/aboul3la/Sublist3r')
md5sums=('SKIP')

pkgver() {
  cd "Sublist3r"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mv ./Sublist3r ./sublist3r-git
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

