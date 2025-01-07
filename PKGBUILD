# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=sftpman-python
epoch=1
pkgver=1.3.0
pkgrel=1
pkgdesc="A CLI application for managing and mounting sshfs (SFTP) filesystems"
arch=('any')
url="https://github.com/spantaleev/sftpman"
license=('GPL3')
depends=('python' 'sshfs' 'python-setuptools')
makedepends=('git')
optdepends=('sftpman-gtk: GTK frontend for sftpman v1')
suggests=('sftpman: sftpman v2+, rewritten in Rust')
conflicts=('sftpman')
install=$pkgname.install
source=("git+https://github.com/spantaleev/sftpman-python.git#tag=$pkgver")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

	install -Dm 755 sleep-scripts/sleep.d/49-sftpman-unmount-all "$pkgdir/etc/pm/sleep.d/49-sftpman-unmount-all"
	install -Dm 755 sleep-scripts/system-sleep/sftpman-unmount-all.sh "$pkgdir/usr/lib/systemd/system-sleep/sftpman-unmount-all.sh"
	install -Dm 644 bash_completion.d/sftpman "$pkgdir/usr/share/bash-completion/completions/sftpman"
}
