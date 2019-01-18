# Maintainer: Henry78 <henry78@gmx.at>
pkgname=runrestic
pkgver=0.2.8
pkgrel=1
pkgdesc='A wrapper script for Restic backup software that inits, creates, prunes and checks backups'
arch=(any)
url='https://github.com/andreasnuesslein/runrestic'
license=('GPL3')
depends=('python' 'python-toml')
source=('https://github.com/andreasnuesslein/runrestic/archive/0.2.8.tar.gz')
md5sums=('5334faa77135db50407511552cb197fa')

build() {
    cd $pkgname-$pkgver
	python3 setup.py build
}

package() {
    cd $pkgname-$pkgver
    python3 setup.py install --root=$pkgdir/ --optimize=1 --skip-build

	sed -i 's%/usr/local%/usr%' sample/systemd/runrestic.service
	install -Dm644 sample/systemd/runrestic.service ${pkgdir}/usr/lib/systemd/system/runrestic.service
	install -Dm644 sample/systemd/runrestic.timer   ${pkgdir}/usr/lib/systemd/system/runrestic.timer
}
