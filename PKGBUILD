# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=sftpman
epoch=1
pkgver=0.6.3
pkgrel=1
pkgdesc="Application that handles sshfs/sftp file systems mounting."
arch=('any')
url="https://github.com/spantaleev/sftpman"
license=('BSD')
depends=('python' 'sshfs' 'python-setuptools')
makedepends=('git')
optdepends=('sftpman-gtk: GTK frontend')
install=$pkgname.install
source=("git+https://github.com/spantaleev/sftpman.git#tag=$pkgver")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 755 sleep-scripts/sleep.d/49-sftpman-unmount-all "$pkgdir/etc/pm/sleep.d/49-sftpman-unmount-all"
	install -Dm 755 sleep-scripts/system-sleep/sftpman-unmount-all.sh "$pkgdir/usr/lib/systemd/system-sleep/sftpman-unmount-all.sh"
	install -Dm 644 bash_completion.d/sftpman "$pkgdir/usr/share/bash-completion/completions/sftpman"
}
