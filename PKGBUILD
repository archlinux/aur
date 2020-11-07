# Maintainer: Roberto Bochet <robertobochet@gmail.com>
pkgname="python-yabu"
pkgver="0.1.3.3"
pkgrel=1
pkgdesc="An utility that exploiting rsync allows to automatize backup tasks, also for remote servers."
arch=("any")
url="https://github.com/RobertoBochet/yabu"
license=("GPL3")
depends=("rsync" "python" "python3-yamale")
makedepends=("python" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/y/yabu/yabu-$pkgver.tar.gz")
sha256sums=("0e1c9a51c935e211ce5b76f3e5c9a472bf3c1bacc88450c4fd9a04c19e7a5202")
backup=("etc/yabu/config.yaml")

build() {
	cd "yabu-$pkgver"
	ls -a
	python setup.py build
}

package() {
	cd "yabu-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 utilities/systemd_units/yabu.service ${pkgdir}/usr/lib/systemd/system/yabu.service
	install -Dm644 utilities/systemd_units/yabu.timer ${pkgdir}/usr/lib/systemd/system/yabu.timer

	install -Dm644 config.example.yaml ${pkgdir}/etc/yabu/config.yaml
}
