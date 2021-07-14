# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
# Contributor: Alexander Epaneshnikov <aarnaarn2@gmail.com>
pkgname=python-magic-wormhole-mailbox-server
pkgver=0.4.1
pkgrel=2
pkgdesc="Run a mailbox server for magic-wormhole"
arch=("any")
url="https://github.com/magic-wormhole/magic-wormhole-mailbox-server"
license=("MIT")
depends=("python-twisted" "python-autobahn")
makedepends=("python-setuptools")
optdepends=("magic-wormhole: client required to use this server")
checkdepends=("python-mock" "python-treq")
conflicts=("${pkgname}" "${pkgname}-git")
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=("1af10592909caaf519c00e706eac842c5e77f8d4356215fe9c61c7b2258a88fb")
sha512sums=("17e66d61589b2a9620d56a4df82489d0c9aad40b6d61ff89c6b44e2ab96f8f4f12849879d5950025cbc7a657a2cd6f1afb36505adad52566f57571de645b70a4")
b2sums=("560275204cdb5648a8e448606870e10016d6cf64627381761000cee2502a6faf02085471d8062848ecce4092aa6c15e360240e30f29ae7c1950f2f7ac11af466")

build() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py build
}

check() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py test
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -vDm 644 docs/*.md -t "${pkgdir}/usr/share/docs/${pkgname}"
}
