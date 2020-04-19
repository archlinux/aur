# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=opensend-git
pkgver=r38.003c27d
pkgrel=1
pkgdesc="Send files and URLs securely across systems"
arch=('any')
license=('GPLv2')
depends=('python' 'python-pip' 'python-pynacl' 'python-zeroconf' 'python-pyftpdlib' 'python-pyqt5')
source=('git+https://gitlab.com/moussaelianarsen/opensend.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/opensend"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$srcdir/opensend"
	DESTDIR="$pkgdir/" SUPRESSPIP=true python3 install.py
	# Install PyAESCrypt using pip as it is not available in repos or AUR
	python3 -m pip install pyAesCrypt
}
