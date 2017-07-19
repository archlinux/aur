# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=image-bootstrap-git
pkgver=r423.d4c97e1
pkgrel=1
pkgdesc="Command line tool to generate bootable virtual machine images and write them to a block device"
arch=('any')
url="https://github.com/hartwork/image-bootstrap"
license=('AGPL')
depends=(
	'python2>=2.6.6' 'python2-colorama' 'python2-beautifulsoup4'
	'python2-requests' 'python2-setuptools' 'python2-lxml' 'python2-yaml'
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
