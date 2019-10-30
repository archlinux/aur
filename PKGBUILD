# Maintainer: Falke Carlsen "cogitantium" <falke.cs@gmail.com>
_pkgname=chwifi
pkgname=${_pkgname}-git
pkgver=r185.5249f1a
pkgrel=1
pkgdesc="network profile manager for wireless networks with rolling password systems"
arch=('any')
url="https://github.com/cogitantium/chwifi"
license=('GPL3')
depends=('sudo'
    'netctl>=1.20'
    'perl>=5.28.1'
    'curl>=7.64.0'
    'libxml2>=2.9.9')
optdepends=('macchanger: required for MAC-address spoofing')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgname}")
source=("${_pkgname}-$pkgver::git+https://github.com/cogitantium/chwifi.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"
    mkdir -p "$pkgdir/usr/lib/chwifi"
    mkdir -p "$pkgdir/usr/bin"
    # Install script to lib
    install chwifi config.sample setup.sh passwordhandler.sh cashandler.sh -t "$pkgdir/usr/lib/chwifi"
    # Symlink script from lib to bin
    ln -s /usr/lib/chwifi/chwifi "$pkgdir/usr/bin/chwifi"
}
