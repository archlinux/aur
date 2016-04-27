# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=sftpman
epoch=1
pkgver=0.6.2
pkgrel=1
pkgdesc="Application that handles sshfs/sftp file systems mounting."
arch=('any')
url="https://github.com/spantaleev/sftpman"
license=('BSD')
depends=('python' 'sshfs' 'python-setuptools')
makedepends=('git')
optdepends=('sftpman-gtk: GTK frontend')
install=$pkgname.install
source=('vcs-repository::git://github.com/spantaleev/sftpman.git#tag='$pkgver)
md5sums=('SKIP')

package() {
	cd "$srcdir/vcs-repository"
	python setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1

	install -Dm 644 $srcdir/vcs-repository/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm 755 $srcdir/vcs-repository/sleep-scripts/sleep.d/49-sftpman-unmount-all $pkgdir/etc/pm/sleep.d/49-sftpman-unmount-all
	install -Dm 755 $srcdir/vcs-repository/sleep-scripts/system-sleep/sftpman-unmount-all.sh $pkgdir/usr/lib/systemd/system-sleep/sftpman-unmount-all.sh
	install -Dm 644 $srcdir/vcs-repository/bash_completion.d/sftpman $pkgdir/etc/bash_completion.d/sftpman
}
