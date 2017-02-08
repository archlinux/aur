# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=ssh-import-id-bzr
pkgver=5.7.r212
pkgrel=2
pkgdesc="Authorize SSH public keys from trusted online identities"
arch=('any')
url="https://launchpad.net/ssh-import-id"
license=('GPL')
depends=('python' 'python-requests' 'python-setuptools' 'wget' 'ca-certificates' 'openssh')
makedepends=('bzr' 'python')
provides=("${pkgname%-bzr}")
conflicts=("${pkgname%-bzr}")
options=(!emptydirs)
source=('bzr+lp:ssh-import-id')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-bzr}"
	version=$(python -c 'import ssh_import_id; print(ssh_import_id.__version__)')
	printf "$version.r%s" "$(bzr revno)"
}

package() {
	cd "$srcdir/${pkgname%-bzr}"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 usr/share/man/man1/ssh-import-id.1 "${pkgdir}/usr/share/man/man1/ssh-import-id.1"
	install -Dm644 etc/ssh/ssh_import_id "${pkgdir}/etc/ssh/ssh_import_id"
}
