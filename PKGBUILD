# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=image-bootstrap-git
pkgver=2.0.1.r0.g3c6fd38
pkgrel=1
epoch=2
pkgdesc="Command line tool to generate bootable virtual machine images and write them to a block device"
arch=('any')
url="https://github.com/hartwork/image-bootstrap"
license=('AGPL')
depends=(
	'python' 'python-colorama' 'python-beautifulsoup4'
	'python-requests' 'python-setuptools' 'python-lxml' 'python-yaml'
	'gnupg' 'parted'
	
	# aur
	'multipath-tools' # for kpartx
	)
makedepends=('git')
optdepends=(
	'ubuntu-keyring: for generating Ubuntu images'
	'grub: for host-grub2 bootloader'
	'mbr: for host-extlinux bootloader'
	'syslinux: for host-extlinux bootloader'
	'debootstrap: for generating Debian/Ubuntu images'
	'debian-archive-keyring: for generating Debian/Ubuntu images'
	)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=(!emptydirs)
source=('git+https://github.com/hartwork/image-bootstrap.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
