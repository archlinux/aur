# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=freenom-dns-updater
pkgver=1.2.9
pkgrel=2
pkgdesc="Tool written in Python to update Freenom DNS records"
arch=('any')
url="https://github.com/maxisoft/Freenom-dns-updater"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-yaml' 'python-six' 'python-click' 'python-oscrypto')
makedepends=('python-setuptools')
checkdepends=('python-httpretty' 'flake8' 'python-flake8-bugbear' 'python-flake8-isort' 'python-flake8-pep3101' 'python-flake8-fixme' 'python-flake8-mutable' 'bandit' 'mypy')
backup=('etc/freenom.yml')
source=("https://github.com/maxisoft/Freenom-dns-updater/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cd21098f04be70579999f287404e094a0b5118b4622f009d02e14e8182ce3bf4')

build() {
	cd Freenom-dns-updater-$pkgver
	python setup.py build
}

check() {
	cd Freenom-dns-updater-$pkgver
	python setup.py test
}

package() {
	cd Freenom-dns-updater-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 systemd/system/freenom-dns-updater.service ${pkgdir}/usr/lib/systemd/system/freenom-dns-updater.service
	install -Dm644 freenom.yml ${pkgdir}/etc/freenom.yml
}
